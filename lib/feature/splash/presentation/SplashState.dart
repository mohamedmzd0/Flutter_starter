

sealed class SplashState {
  const SplashState();
}

class SplashInitial extends SplashState {
  const SplashInitial();
}

class SplashLoading extends SplashState {
  const SplashLoading();
}

class SplashFailure extends SplashState {
  final String message;
  const SplashFailure(this.message);
}

class NavigateToLogin extends SplashState {
  const NavigateToLogin();
}

class NavigateToHome extends SplashState {
  const NavigateToHome();
}