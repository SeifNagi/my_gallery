import 'package:flutter/material.dart';
import '../../../presentation/components/login/form_widget.dart';
import '../../styles/text_style.dart';

class FormAndText extends StatelessWidget {
  const FormAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: FittedBox(
            child: Text('    My \n Gallery', style: mainTitle),
          ),
        ),
        const FormWidget()
      ],
    );
  }
}
