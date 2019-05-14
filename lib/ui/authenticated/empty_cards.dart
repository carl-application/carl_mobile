import 'package:carl/localization/localization.dart';
import 'package:carl/ui/theme.dart';
import 'package:flutter/material.dart';

class EmptyCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageSize =  MediaQuery.of(context).size.width * .3;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration:
                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(1000.0)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                "assets/empty_cards.png",
                fit: BoxFit.contain,
                width: imageSize,
                height: imageSize,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            Localization.of(context).emptyCardsTitle,
            style: CarlTheme.of(context).blackTitle,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            Localization.of(context).emptyCardsDescription,
            style: CarlTheme.of(context).blackMediumLabel,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
