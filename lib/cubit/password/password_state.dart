abstract class PasswordState {}

class InitialPasswordState extends PasswordState {}

class LoadingPasswordState extends PasswordState {}

class RefreshPasswordState extends PasswordState {}

class ErrorPasswordState extends PasswordState {
  final String errorMessage;
  ErrorPasswordState({required this.errorMessage});
}

class MessageNewPasswordState extends PasswordState {}

class SuccessedRepasswordState extends PasswordState {}
