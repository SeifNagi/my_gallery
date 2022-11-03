import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/presentation/pages/gallery.dart';
import '../../bloc/login/login_cubit.dart';
import '../../bloc/login/login_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: Stack(
            children: [
              Image.asset(
                'assets/my_gallery/CompositeLayer.png',
              ),
              Column(children: [
                const Text('My \n Gallery'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 200,
                    height: 350,
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(20)),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Log in'),
                          //StadiumBorder(side: BorderStyle.solid)
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: TextFormField(
                              controller: usernameController,
                              cursorColor: Colors.green,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'User Name',
                              ),
                              validator: (value) {
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
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: TextFormField(
                                controller: passwordController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                }),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                  LoginCubit.get(context).postLoginData(
                                      email: usernameController.text,
                                      password: passwordController.text);
                                  if (state is LoginSucceessState) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              GalleryScreen()),
                                    );
                                  }
                                }
                              },
                              child: const Text('Submit'))
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ));
        });
  }
}
