import 'package:flutter/material.dart';
import 'package:guesnime/BaseDeDatos.dart';
import 'package:guesnime/Usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _usuario = '';

  @override
  void initState() {
    super.initState();
    _getUsuarios();
  }

void _getUsuarios() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String usuario = prefs.getString('usuario') ?? '';
  setState(() {
    _usuario = usuario;
  });

  // Aquí es donde imprimirás la lista de usuarios registrados en la base de datos
  List<Usuario> usuarios = await BaseDeDatos.getUsuarios();
  print('Lista de usuarios registrados:');
  for (var usuario in usuarios) {
    print('Nombre: ${usuario.nombre}, estrellas: ${usuario.estrellas}');
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF394065),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/guesnimelogo.png',
                height: 350,
                width: 296,
              ),
              SizedBox(height: 10),
              Text(
                'Bienvenido $_usuario!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                 Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text('Jugar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}