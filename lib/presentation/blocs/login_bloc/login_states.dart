abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class ChangePasswordEyeState extends LoginStates {}

class RegisterLoadingState extends LoginStates {}

class RegisterSuccessState extends LoginStates {
  final userCredential;
  RegisterSuccessState(this.userCredential);
}

class RegisterErrorState extends LoginStates {
  final String errorMessage;
  RegisterErrorState(this.errorMessage);
}

class AddUserToFireStoreLoadingState extends LoginStates {}

class AddUserToFireStoreSuccessState extends LoginStates {
  final userCredential;
  AddUserToFireStoreSuccessState(this.userCredential);
}

class AddUserToFireStoreErrorState extends LoginStates {
  final String errorMessage;
  AddUserToFireStoreErrorState(this.errorMessage);
}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final userCredential;
  LoginSuccessState(this.userCredential);
}

class LoginErrorState extends LoginStates {
  final String errorMessage;
  LoginErrorState(this.errorMessage);
}
