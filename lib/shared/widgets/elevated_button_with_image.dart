import 'package:flutter/material.dart';
import 'package:my_gallery/presentation/styles/colors.dart';

class CustomizedButtonWithImage extends StatelessWidget {
  final String buttonText;
  final String imagePath;
  final Function onpress;
  const CustomizedButtonWithImage(
      {super.key,
      required this.buttonText,
      required this.imagePath,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(imagePath),
      TextButton(
          onPressed: () {
            onpress();
          },
          child: Text(
            buttonText,
            style: TextStyle(color: blackColor),
          ))
    ]);
  }
}
