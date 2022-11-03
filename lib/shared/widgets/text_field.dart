import 'package:flutter/material.dart';
import '../../presentation/styles/colors.dart';
import '../../presentation/styles/text_style.dart';

class CustomizedTextField extends StatelessWidget {
  final TextEditingController formController;
  final String labelName;
  final FormFieldValidator<String> validate;
  const CustomizedTextField(
      {super.key,
      required this.formController,
      required this.labelName,
      required this.validate});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 20,
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        controller: formController,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 8.0, bottom: 10.0, top: 8.0),
            border: InputBorder.none,
            hintText: labelName,
            hintStyle: hintStyle),
        validator: validate,
      ),
    );
  }
}
