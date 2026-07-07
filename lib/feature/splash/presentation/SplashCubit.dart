import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/feature/splash/presentation/SplashState.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashInitial());

  Future<void> initialize() async {
    emit(const SplashLoading());

    await Future.delayed(const Duration(seconds: 2));

    final hasToken = false;

    if (hasToken) {
      emit(const NavigateToHome());
    } else {
      emit(const NavigateToLogin());
    }
  }
}