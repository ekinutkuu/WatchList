import 'package:flutter/material.dart';
import 'package:watchlist/constants/colors.dart';

void showAlertDialog(BuildContext context, String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        //content: Text(content),
        backgroundColor: PaleBlue,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK!'),
          ),
        ],
      );
    },
  );
}