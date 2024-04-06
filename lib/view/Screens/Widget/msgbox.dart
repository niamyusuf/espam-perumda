import 'package:flutter/material.dart';

class MsgBoxOk extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;

  const MsgBoxOk({super.key, 
    required this.title,
    required this.content,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
        
      ],
    );
  }
}

class MsgBoxOkCancel extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;

  const MsgBoxOkCancel({super.key, 
    required this.title,
    required this.content,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: onConfirm,
          child: const Text('Ok'),
        ),
      ],
    );
  }
}