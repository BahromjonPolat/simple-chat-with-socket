/*
    Created by: Bakhromjon Polat
    Created on: Dec 17 2022 13:44:47

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/


import 'package:flutter/material.dart';
import 'package:websocket/routes/app_navigator.dart';

class AppDialog {
  final BuildContext context;
  const AppDialog(this.context);

  Future<void> showSimpleDialog({
    String title = '',
    String contentText = '',
    VoidCallback? onYesPressed,
  }) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(contentText),
            actions: [
               const TextButton(
                onPressed: AppNavigator.pop,
                child: Text('No'),
              ),
              TextButton(
                onPressed: onYesPressed,
                child:  const Text('Yes'),
              ),
            ],
          );
        });
  }
}
