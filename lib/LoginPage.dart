import 'package:flutter/material.dart';
import 'package:guesnime/BaseDeDatos.dart';
import 'package:guesnime/Usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animate_do/animate_do.dart';
import 'package:guesnime/EstrellasProvider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _usuario;

  @override
  void initState() {
    super.initState();
    _getUsuarios();
  }

  void _getUsuarios() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? usuario = prefs.getString('usuario');
    setState(() {
      _usuario = usuario;
    });

    // Aquí es donde imprimirás la lista de usuarios registrados en la base de datos
    List<Usuario> usuarios = await BaseDeDatos.getUsuarios();
    print('Lista de usuarios registrados:');
    for (var usuario in usuarios) {
      print('Nombre: ${usuario.nombre}, estrellas: ${usuario.estrellas}');
      Provider.of<StarsProvider>(context, listen: false).setStars(usuario.estrellas);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color:  Color(0xFF394065),
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
              const SizedBox(height: 10),
              FutureBuilder(
                future: Future.delayed(const Duration(seconds: 2)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return FadeInUpBig(
                      child: Text(
                        '${_usuario ?? ''} Bienvenido a Guesnime!',
                        style: const TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: const Text('Jugar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}