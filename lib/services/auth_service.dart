import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  //static const _loggedInKey = 'isLoggedIn';

  // Save user credentials
  Future<void> saveUserToSharedPrefs(String username, String email, String password, bool isLoggedIn) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setString('username', username);
    await sharedPrefs.setString('email', email);
    await sharedPrefs.setString('password', password);
    await sharedPrefs.setBool('isLoggedIn', isLoggedIn);
    print(sharedPrefs.getString('username'));
    print(sharedPrefs.getBool('isLoggedIn'));
  }

  // Retrieve user credentials
  Future<void> getUserFromSharedPrefs() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    final savedUsername = sharedPrefs.getString('username');
    final savedEmail = sharedPrefs.getString('email');
    final savedPassword = sharedPrefs.getString('password');
  }

  Future<bool> isUserLoggedIn() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getBool('isLoggedIn') ?? false;
  }
}