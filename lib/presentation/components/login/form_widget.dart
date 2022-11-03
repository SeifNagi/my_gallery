import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/login/login_cubit.dart';
import '../../../bloc/login/login_states.dart';
import '../../../shared/widgets/elevated_button.dart';
import '../../../shared/widgets/text_field.dart';
import '../../pages/gallery_screen.dart';
import '../../styles/text_style.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width / 1.5,
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(20)),
                height: height / 2.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FittedBox(
                            child: Text(
                              'Log in',
                              style: subTitle,
                            ),
                          ),
                          CustomizedTextField(
                            formController: usernameController,
                            labelName: ' User Name',
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please your email';
                              }
                              if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(usernameController.text) ==
                                  false) {
                                return 'InValid Email';
                              }
                              return null;
                            },
                          ),
                          CustomizedTextField(
                              validate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              formController: passwordController,
                              labelName: ' Password'),
                          SizedBox(
                            width: width / 1.8,
                            child: CustomizedButton(
                                buttonText: 'Submit',
                                onpress: () {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).postLoginData(
                                        email: usernameController.text,
                                        password: passwordController.text);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Processing data')));
                                    if (state is LoginSucceessState) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => GalleryScreen(),
                                        ),
                                      );
                                    } else if (state is LoginErrorState) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(state.error)));
                                    }
                                  }
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
