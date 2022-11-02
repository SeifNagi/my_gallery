import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/data/endpoints.dart';
import 'package:my_gallery/data/model/login_model.dart';
import '../bloc/login_states.dart';

import '../data/network/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  void postLoginData({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: loginPath,
      dataTobody: {'email': email, 'password': password},
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      debugPrint(value.data.toString());
      debugPrint('Login Success:${value.data}');
      emit(LoginSucceessState());
    }).catchError((error) {
      debugPrint('Login error:$error');
      emit(LoginErrorState(error.toString()));
    });
  }
}
