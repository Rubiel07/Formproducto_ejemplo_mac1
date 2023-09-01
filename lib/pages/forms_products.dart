import 'package:flutter/material.dart';

class FormsProductsPage extends StatelessWidget {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productCantidadController =
      TextEditingController();
  final TextEditingController productCodigoController = TextEditingController();
  final TextEditingController productPrecioController =
      TextEditingController(); // Definir el controlador

  void _submitForm(BuildContext context) {
    // Aquí puedes realizar la lógica de guardar el producto con los datos ingresados en los controladores
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insertar Productos'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: productCodigoController,
                decoration: InputDecoration(
                  labelText: 'Código del Producto',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: productNameController,
                decoration: InputDecoration(
                  labelText: 'Nombre del Producto',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: productCantidadController,
                decoration: InputDecoration(
                  labelText: 'Cantidad del Producto',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: productPrecioController,
                decoration: InputDecoration(
                  labelText: 'Precio del Producto',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => _submitForm(context),
                child: Text('Guardar Producto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
