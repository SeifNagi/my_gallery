abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginSucceessState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}
