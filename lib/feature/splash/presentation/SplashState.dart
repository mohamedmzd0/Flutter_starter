

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
  const SplashFailure();
}

class NavigateToLogin extends SplashState {
  const NavigateToLogin();
}

class NavigateToHome extends SplashState {
  const NavigateToHome();
}