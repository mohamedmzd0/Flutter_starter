import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/core/pref/SharedPref.dart';
import 'package:starter/feature/auth/data/data/CheckMailResponse.dart';
import 'package:starter/feature/auth/domain/AuthRepo.dart';
import 'package:starter/feature/auth/presentation/login/LoginState.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._pref, this._authRepo) : super(const LoginInitial());
  final SharedPref _pref;

  final AuthRepo _authRepo;
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    CheckMailResponse response = await _authRepo.login(email, password);

    if (response.success == true) {
      // _pref.saveToken("token");
      emit(LoginSuccess());
    } else {
      _pref.removeToken();
      emit(LoginFailure("Invalid email or password"));
    }

  }
}
