import 'package:latihan_navigator/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final String stateKey = 'state';
  final String userKey = 'user';

  Future<bool> isLoggedIn() async {
    final pref = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    return pref.getBool(stateKey) ?? false;
  }

  Future<bool> login() async {
    final pref = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    return pref.setBool(stateKey, true);
  }

  Future<bool> logout() async {
    final pref = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    return pref.setBool(stateKey, false);
  }

  Future<bool> saveUser(User user) async {
    final pref = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    return pref.setString(userKey, user.toJson());
  }

  Future<bool> deleteUser() async {
    final pref = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    return pref.setString(userKey, '');
  }

  Future<User?> getUser() async {
    final pref = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    final json = pref.getString(userKey) ?? '';
    User? user;

    try {
      user = User.fromJson(json);
    } catch (e) {
      user = null;
    }
    return user;
  }
}
