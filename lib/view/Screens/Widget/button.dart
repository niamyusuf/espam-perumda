import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final String imagePath;
  final Function onPressedEvent;

  const Button(this.text, this.imagePath, this.onPressedEvent, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/$imagePath',
            height: 30,
            width: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
      onPressed: () {
        onPressedEvent();
      },
    );
  }
}
