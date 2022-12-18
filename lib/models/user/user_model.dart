// ignore_for_file: unnecessary_getters_setters

import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String? _username;
  @HiveField(1)
  String? _email;
  @HiveField(2)
  String? _password;
  @HiveField(3)
  bool? _isAvatarImageSet;
  @HiveField(4)
  String? _avatarImage;
  @HiveField(5)
  String? _sId;
  @HiveField(6)
  int? _iV;

  UserModel(
      {String? username,
      String? email,
      String? password,
      bool? isAvatarImageSet,
      String? avatarImage,
      String? sId,
      int? iV}) {
    if (username != null) {
      _username = username;
    }
    if (email != null) {
      _email = email;
    }
    if (password != null) {
      _password = password;
    }
    if (isAvatarImageSet != null) {
      _isAvatarImageSet = isAvatarImageSet;
    }
    if (avatarImage != null) {
      _avatarImage = avatarImage;
    }
    if (sId != null) {
      _sId = sId;
    }
    if (iV != null) {
      _iV = iV;
    }
  }

  String? get username => _username;
  set username(String? username) => _username = username;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get password => _password;
  set password(String? password) => _password = password;
  bool? get isAvatarImageSet => _isAvatarImageSet;
  set isAvatarImageSet(bool? isAvatarImageSet) =>
      _isAvatarImageSet = isAvatarImageSet;
  String? get avatarImage => _avatarImage;
  set avatarImage(String? avatarImage) => _avatarImage = avatarImage;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  UserModel.fromJson(Map<String, dynamic> json) {
    _username = json['username'];
    _email = json['email'];
    _password = json['password'];
    _isAvatarImageSet = json['isAvatarImageSet'];
    _avatarImage = json['avatarImage'];
    _sId = json['_id'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = _username;
    data['email'] = _email;
    data['password'] = _password;
    data['isAvatarImageSet'] = _isAvatarImageSet;
    data['avatarImage'] = _avatarImage;
    data['_id'] = _sId;
    data['__v'] = _iV;
    return data;
  }
}
