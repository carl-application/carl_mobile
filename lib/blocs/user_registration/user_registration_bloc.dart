import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:carl/blocs/authentication/authentication_bloc.dart';
import 'package:carl/blocs/user_registration/user_registration_event.dart';
import 'package:carl/blocs/user_registration/user_registration_state.dart';
import 'package:carl/data/repositories/user_repository.dart';

class UserRegistrationBloc
    extends Bloc<UserRegistrationEvent, UserRegistrationState> {
  UserRegistrationBloc(this._userRepository, this._authenticationBloc);

  final UserRepository _userRepository;
  final AuthenticationBloc _authenticationBloc;

  @override
  UserRegistrationState get initialState => RegistrationNotStarted();

  @override
  Stream<UserRegistrationState> mapEventToState(
    UserRegistrationEvent event,
  ) async* {
    if (event is StartRegistrationEvent) {
      yield RegistrationStarted();
    }

    if (event is SetUsernameEvent) {
      final username = event.userName;

      yield UserNameSet(userName: username);
    }
  }
}