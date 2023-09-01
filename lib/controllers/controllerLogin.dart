import 'package:formproducto_ejemplo_mac/models/modelLogin.dart';

class LoginController {
  final UserModel user;

  LoginController(this.user);

  bool isValidCredentials(String enteredUsername, String enteredPassword) {
    return enteredUsername == user.username && enteredPassword == user.password;
  }
}
