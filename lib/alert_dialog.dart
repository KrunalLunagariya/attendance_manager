// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

enum DialogsAction{yes, cancel}

class AlertDialogs{
  static Future<DialogsAction> yesCancelDialog(
      BuildContext context,
      String title,
      String body,
      ) async {
    final action = await showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(title),
        content: Text(body),
        actions: <Widget>[
          ElevatedButton(onPressed: () => Navigator.of(context).pop(DialogsAction.cancel),
              child: const Text('No'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              )
          ),
          ElevatedButton(onPressed: () => Navigator.of(context).pop(DialogsAction.yes),
              child: const Text('Yes'),
          style: ElevatedButton.styleFrom(
          primary: Colors.green,
          )
          )        ],
      );
    }
    );
    return (action != null) ? action : DialogsAction.cancel;
  }
}