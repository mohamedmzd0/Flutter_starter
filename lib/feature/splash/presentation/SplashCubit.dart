import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:starter/core/network/api_client.dart';
import 'package:starter/core/pref/SharedPref.dart';
import 'package:starter/feature/auth/data/UpdateResponse.dart';
import 'package:starter/feature/auth/domain/AuthRepo.dart';
import 'package:starter/feature/splash/presentation/SplashState.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._pref, this._authRepo) : super(const SplashInitial());

  final SharedPref _pref;
  final AuthRepo _authRepo;

  Future<void> initialize() async {
    final version = await PackageInfo.fromPlatform().then((value) => value.version);

    emit(const SplashLoading());

    UpdateResponse? versionInfo;
    try {
      versionInfo = await _authRepo.getAppVersion();
    } on ApiException catch (e) {
      emit(SplashFailure(e.message));
      return;
    } catch (_) {
      emit(const SplashFailure('Something went wrong'));
      return;
    }

    final forceUpdate = versionInfo.result?.forceUpdate ?? false;
    final lastVersion = versionInfo?.result?.version ?? "0";
    if (forceUpdate) {
      emit(const SplashFailure('A new version is required.'));
      return;
    }
/*

    if (version!=lastVersion) {
      emit(const SplashFailure('A new version is optional.'));
      return;
    }
*/

    final token = _pref.getToken();
    final hasToken = token != null && token.isNotEmpty;

    if (hasToken) {
      // emit(const NavigateToHome());
      emit(const NavigateToLogin());
    } else {
      emit(const NavigateToLogin());
    }
  }


  Future<void> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    print("App Name: ${packageInfo.appName}");
    print("Package Name: ${packageInfo.packageName}");
    print("Version: ${packageInfo.version}");
    print("Build Number: ${packageInfo.buildNumber}");
  }
}
