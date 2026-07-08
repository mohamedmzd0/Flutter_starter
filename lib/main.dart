import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:starter/app/di/service_locator.dart';
import 'package:starter/app/router/app_router.dart';
import 'package:starter/feature/auth/presentation/login/LoginCubit.dart';
import 'package:starter/feature/auth/presentation/login/LoginScreen.dart';
import 'package:starter/feature/home/presentation/home_screen.dart';
import 'package:starter/feature/splash/presentation/SplashCubit.dart';
import 'package:starter/feature/splash/presentation/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.splash,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (_) => GetIt.instance<SplashCubit>(),
          child: const SplashScreen(),
        );
      },
    ),
    GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: Routes.login,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (_) => GetIt.instance<LoginCubit>(),
          child: const LoginScreen(),
        );
      },
    ),
  ],
);
