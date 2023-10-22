import 'package:flutter/material.dart';
import 'package:guesnime/LoginPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              SizedBox(height: 20), // Espacio entre el logo y los campos
              Container(
                width: 280, // Ajusta el ancho de los campos
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre de usuario',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 280, //
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: InputBorder.none,
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20), // Espacio entre los campos y el botón
              ElevatedButton(
                onPressed: () {
                  // Código para iniciar sesión
                },
                child: Text('Iniciar sesión'),
              ),
              SizedBox(height: 10), // Espacio entre el botón de inicio de sesión y el botón de registro
              Text(
                '¿No tienes una cuenta? Regístrate aquí',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}