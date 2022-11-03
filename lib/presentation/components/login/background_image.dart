import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String imagePath;
  const BackgroundImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Image.asset(imagePath,
        fit: BoxFit.cover, height: height, width: width);
  }
}
