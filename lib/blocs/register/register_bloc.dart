/*
    Created by: Bakhromjon Polat
    Created on: Dec 18 2022 11:32:09

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/


import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:websocket/hive_helper/app_prefs.dart';
import 'package:websocket/models/user/user_model.dart';
import 'package:websocket/services/api_service.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {});
  }

  FutureOr<void> _register(
    RegisterUserEvent event,
    Emitter emit,
  ) async {
    emit(RegisterLoadingState());

    HttpResult result = await ApiService.register(
      username: event.username,
      email: event.email,
      password: event.password,
    );

    if (result.isSuccess) {
      UserModel user = UserModel.fromJson(result.getData()['user']);
      await AppPrefs.setUser(user);
      emit(RegisterSuccessState());
    } else {
      emit(RegisterFailedState(result.response.toString()));
    }
  }
}
