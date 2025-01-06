abstract class AuthRegisterState {}

class InitialRegisterState extends AuthRegisterState {}

class LoadingRegisterState extends AuthRegisterState {}

class SuccessedRegisterState extends AuthRegisterState {}

class GoToEmailRegisterState extends AuthRegisterState {}

class ErrorRegisterState extends AuthRegisterState {
  final String errorMessage;
  ErrorRegisterState({required this.errorMessage});
}

class GoogleNullRegisterState extends AuthRegisterState {}
