sealed class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class InvalidEmail extends LoginState {
  const InvalidEmail();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginFailure extends LoginState {
  final String message ;
  const LoginFailure(this.message);
}

class LoginSuccess extends LoginState {
  const LoginSuccess();
}