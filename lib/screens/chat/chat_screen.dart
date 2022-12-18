/*
    Created by: Bakhromjon Polat
    Created on: Dec 18 2022 12:24:45

    Github: https://github.com/BahromjonPolat
    Leetcode: https://leetcode.com/BahromjonPolat/
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Documentation: 

*/


import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../models/user/user_model.dart';

class ChatScreen extends StatefulWidget {
  final UserModel user;
  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late UserModel user;

  late IO.Socket _socket;
  _connectSocket() {
    _socket = IO.io(
      'http://192.168.43.42:5000',
      IO.OptionBuilder().setTransports(['websocket']).build(),
    );

    _socket.io.on('connection', (data) => print(data));
    _socket.onConnect((data) => print('Connection established'));
    _socket.onConnectError((data) => print('Connect Error: $data'));
    _socket.onDisconnect((data) => print('Socket.IO server disconnected'));
    _socket.on(
      'message',
      (data) => print(data),
    );
  }

  @override
  void initState() {
    super.initState();
    user = widget.user;

    _connectSocket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.username ?? '')),
    );
  }

  @override
  void dispose() {
    _socket.close();
    _socket.disconnect();
    _socket.dispose();
    super.dispose();
  }
}
