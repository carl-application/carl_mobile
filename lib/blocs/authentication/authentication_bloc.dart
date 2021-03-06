import 'package:bloc/bloc.dart';
import 'package:carl/blocs/authentication/authentication_event.dart';
import 'package:carl/blocs/authentication/authentication_state.dart';
import 'package:carl/data/repositories/user_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._userRepository, {this.firebaseMessaging});

  final UserRepository _userRepository;
  final FirebaseMessaging firebaseMessaging;

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AppStarted) {
      var beginningProcessusDate = DateTime.now();
      final bool hasToken = await _userRepository.hasToken();
      var endingProcessusDate = DateTime.now();

      if (endingProcessusDate.second - beginningProcessusDate.second <= 4) {
        await Future.delayed(
            Duration(seconds: 4 - (endingProcessusDate.second - beginningProcessusDate.second)));
      }

      if (hasToken) {
        try {
          if (firebaseMessaging != null) {
            final notificationsToken = await firebaseMessaging.getToken();
            await _userRepository.updateNotificationsToken(notificationsToken);
          }
        } catch (error) {
          print("Error updating notifications token : $error");
        }

        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await _userRepository.persistTokens(
          event.tokens.accessToken, event.tokens.refreshToken, event.tokens.expiresIn);

      try {
        if (firebaseMessaging != null) {
          final notificationsToken = await firebaseMessaging.getToken();
          await _userRepository.updateNotificationsToken(notificationsToken);
        }
      } catch (error) {
        print("Error updating notifications token : $error");
      }

      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await _userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }

    if (event is DeleteAccount) {
      yield AuthenticationLoading();
      try {
        await _userRepository.deleteAccount();
        await _userRepository.deleteToken();
      } catch (error) {
        print("Error deleting account : $error");
      }

      yield AuthenticationUnauthenticated();
    }
  }
}
