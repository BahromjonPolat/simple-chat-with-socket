/*
    Created by: Bakhromjon Polat
    Created on: Dec 17 2022 22:18:16

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:websocket/blocs/blocs.dart';
import 'package:websocket/routes/app_navigator.dart';
import 'package:websocket/screens/home/home_screen.dart';
import 'package:websocket/widgets/primary_button.dart';

class RegisterScreen extends StatefulWidget {
  static const String route = 'route';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.name,
                controller: _usernameController,
                decoration: const InputDecoration(hintText: 'Username'),
                validator: (value) => value!.isEmpty ? 'da' : null,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Email'),
                validator: (value) => value!.isEmpty ? 'da' : null,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordController,
                decoration: const InputDecoration(hintText: 'Password'),
                validator: (value) => value!.isEmpty ? 'da' : null,
              ),
              const SizedBox(height: 12),
              BlocProvider(
                create: (context) => RegisterBloc(),
                child: BlocConsumer<RegisterBloc, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterFailedState) {
                      Fluttertoast.showToast(msg: state.error);
                    }

                    if (state is RegisterSuccessState) {
                      AppNavigator.pushNamed(HomeScreen.route);
                    }
                  },
                  builder: (context, state) {
                    return PrimaryButton(
                      isLoading: state is RegisterLoadingState,
                      label: 'Register',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          String username = _usernameController.text.trim();
                          String email = _emailController.text.trim();
                          String password = _passwordController.text.trim();
                          BlocProvider.of<RegisterBloc>(context).add(
                            RegisterUserEvent(
                              password: password,
                              email: email,
                              username: username,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
