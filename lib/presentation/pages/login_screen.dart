import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/presentation/components/login/background_image.dart';
import 'package:my_gallery/presentation/components/login/form_and_text.dart';
import '../../bloc/login/login_cubit.dart';
import '../../bloc/login/login_states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Stack(alignment: Alignment.center, children: const [
                BackgroundImage(
                  imagePath: 'assets/login/background_image.png',
                ),
                FormAndText()
              ]),
            ),
          );
        });
  }
}
