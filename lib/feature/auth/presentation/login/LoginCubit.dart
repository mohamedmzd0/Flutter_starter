import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/feature/auth/presentation/login/LoginState.dart';
import 'package:starter/feature/splash/presentation/SplashState.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    await Future.delayed(const Duration(seconds: 2));

    if (email == "admin@test.com" && password == "123456") {
      emit(LoginSuccess());
    } else {
      emit(LoginFailure("Invalid email or password"));
    }
  }
}
