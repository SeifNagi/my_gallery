import 'package:flutter/material.dart';
import '../../presentation/styles/text_style.dart';

class CustomizedButton extends StatelessWidget {
  final String buttonText;
  final Function onpress;
  const CustomizedButton(
      {super.key, required this.buttonText, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onpress();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        buttonText,
        style: buttonStyle,
      ),
    );
  }
}
