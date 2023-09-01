import 'package:flutter/material.dart';
import 'package:formproducto_ejemplo_mac/pages/formproduct.dart';
import 'package:formproducto_ejemplo_mac/controllers/controllerLogin.dart';
import 'package:formproducto_ejemplo_mac/models/modelLogin.dart';

class FormLogin extends StatefulWidget {
  FormLogin({Key? key}) : super(key: key);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final myController = TextEditingController();
  final usernameController = TextEditingController();

  final LoginController loginController =
      LoginController(UserModel('prueba01', '1234'));

  bool _usernameIsEmpty = false;
  bool _passwordIsEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset('images/thunderCats.jpg',
            height: 150, width: 150, alignment: Alignment.bottomCenter),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: usernameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _usernameIsEmpty ? Colors.red : Colors.grey,
                ),
              ),
              hintText: 'Ingrese login',
              errorText: _usernameIsEmpty ? 'Campo obligatorio' : null,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: myController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _passwordIsEmpty ? Colors.red : Colors.grey,
                ),
              ),
              hintText: 'Ingrese contraseña',
              errorText: _passwordIsEmpty ? 'Campo obligatorio' : null,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(elevation: 2),
            onPressed: () => _validateCredentials(context),
            child: const Text('Ingresar'),
          ),
        ),
      ],
    );
  }

  _validateCredentials(BuildContext context) {
    final enteredUsername = usernameController.text;
    final enteredPassword = myController.text;

    setState(() {
      _usernameIsEmpty = enteredUsername.isEmpty;
      _passwordIsEmpty = enteredPassword.isEmpty;
    });

    if (!_usernameIsEmpty && !_passwordIsEmpty) {
      if (loginController.isValidCredentials(
          enteredUsername, enteredPassword)) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Éxito'),
                content: const Text('Inicio de sesión exitoso!'),
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FormProduct(username: enteredUsername)),
                      );
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text('Error'),
                content: Text('Usuario o contraseña incorrectos.'),
              );
            });
      }
    }
  }
}
