import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:starter/app/router/app_router.dart';
import 'package:starter/feature/auth/presentation/login/LoginCubit.dart';
import 'package:starter/feature/auth/presentation/login/LoginState.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Login")),
        body: Padding(padding: const EdgeInsets.all(16.0), child: Form(
          key: _formKey,
          child: Column(children: [

            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                }
                return null;
              },

              ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password";
                }
                return null;
              },


            ),

            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  context.go(Routes.home);
                }
                if (state is LoginFailure) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    SnackBar(
                      content:
                      Text(state.message),
                    ),
                  );
                }
              }, builder: ( context,  state) {
              if (state is LoginLoading) {
                return const CircularProgressIndicator();
              }

              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;

                      context.read<LoginCubit>().login(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                    },
                  child:
                  const Text("Login"),
                ),
              );
            },),



          ],),
        ),));
  }

}