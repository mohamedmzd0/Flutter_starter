import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter/core/network/api_client.dart';
import 'package:starter/core/pref/SharedPref.dart';
import 'package:starter/core/pref/SharedprefImpl.dart';
import 'package:starter/feature/auth/data/repo/AuthRepoImpl.dart';
import 'package:starter/feature/auth/domain/AuthRepo.dart';
import 'package:starter/feature/auth/presentation/login/LoginCubit.dart';
import 'package:starter/feature/splash/presentation/SplashCubit.dart';


final getIt = GetIt.instance;
final dio = Dio(
  BaseOptions(
    baseUrl: 'https://test-majlestech-api-mysql.mjls.tech/api/',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
  ),
);

Future<void> setupLocator() async {
  final prefs = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(prefs);

  getIt.registerSingleton(dio);
  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
    ),
  );

  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt<Dio>()));
  getIt.registerLazySingleton<SharedPref>(() => SharedPrefImpl(getIt()));
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));

  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<SharedPref>(), getIt<AuthRepo>()),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<SharedPref>(), getIt<AuthRepo>()));

}