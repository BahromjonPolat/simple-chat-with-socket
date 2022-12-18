/*
    Created by: Bakhromjon Polat
    Created on: Dec 18 2022 10:57:57

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:websocket/hive_helper/hive_boxes.dart';
import 'package:websocket/models/user/user_model.dart';
import 'package:websocket/routes/app_navigator.dart';
import 'package:websocket/screens/auth/regiser_screen.dart';
import 'package:websocket/screens/chat/chat_screen.dart';
import 'package:websocket/widgets/widgets.dart';

import '../../blocs/users/users_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String route = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              AppDialog(context).showSimpleDialog(
                title: 'Logout',
                contentText: 'Are you really want to exit',
                onYesPressed: ()async {
                  HiveBoxes.prefBox.clear();
                  AppNavigator.pushNamedAndRemoveUntil(RegisterScreen.route);
                },
              );
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => UsersBloc()..add(GetUsersEvent()),
        child: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is UsersLoadingState) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }

            if (state is UsersFailedState) {
              return Center(child: Text(state.error));
            }
            if (state is UsersSuccessState) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  UserModel user = state.users[index];
                  return ListTile(
                    title: Text(user.username ?? ''),
                    subtitle: Text(user.email ?? ''),
                    onTap: () {
                      AppNavigator.push(ChatScreen(user: user));
                    },
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
