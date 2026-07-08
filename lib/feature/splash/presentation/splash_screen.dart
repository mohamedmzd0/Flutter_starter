import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:starter/app/router/app_router.dart';
import 'package:starter/feature/splash/presentation/SplashCubit.dart';
import 'package:starter/feature/splash/presentation/SplashState.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    context.read<SplashCubit>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        switch (state) {
          case NavigateToLogin():
            context.go(Routes.login);
          case NavigateToHome():
            context.go(Routes.home);
          case SplashInitial():{}
          case SplashLoading():{}
          case SplashFailure():{
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        }
      },
      child: Scaffold(
        body: SafeArea(child: Center(child: const FlutterLogo(size: 120))),
      ),
    );
  }
}
