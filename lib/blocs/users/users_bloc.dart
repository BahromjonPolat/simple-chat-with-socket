import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:websocket/models/user/user_model.dart';
import 'package:websocket/services/api_service.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<GetUsersEvent>(_getUsers);
  }

  FutureOr<void> _getUsers(
    GetUsersEvent event,
    Emitter emit,
  ) async {
    emit(UsersLoadingState());
    HttpResult result = await ApiService.getUsers();
    if (result.isSuccess) {
      List<UserModel> users =
          (result.getData() as List).map((e) => UserModel.fromJson(e)).toList();
      emit(UsersSuccessState(users));
    } else {
      emit(UsersFailedState(result.getData().toString()));
    }
  }
}
