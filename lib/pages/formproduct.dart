import 'package:flutter/material.dart';
import 'package:formproducto_ejemplo_mac/pages/forms_products.dart';

class FormProduct extends StatelessWidget {
  const FormProduct({Key? key, required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo Drawer'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: 300.0, // Ancho del contenedor
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Mostrar el saludo con el nombre del usuario
              Text(
                '¡Bienvenido, $username!',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        //https://docs.flutter.dev/cookbook/design/drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Insertar Productos'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FormsProductsPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
