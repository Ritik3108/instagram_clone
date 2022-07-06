import 'dart:ffi';

import 'package:instagram_flutter/models/user.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifierProvider {
  User _user;
  User get getUser => _user;

  Future<void> refreshUser() async {}
}
