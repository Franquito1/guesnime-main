// ignore: file_names
import 'package:flutter/material.dart';
import 'package:guesnime/BaseDeDatos.dart';
import 'package:guesnime/Usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animate_do/animate_do.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  late BuildContext _context;

  @override
  void initState() {
    super.initState();
    _checkIfUserRegistered();
  }

  void _checkIfUserRegistered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool userRegistered = prefs.getBool('userRegistered') ?? false;
    if (userRegistered) {
      Navigator.pushReplacementNamed(_context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    _checkIfUserRegistered();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
              const SizedBox(height: 10),
              FutureBuilder(
                future: Future.delayed(const Duration(seconds: 2)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return FadeInUpBig(
                      child: const Text(
                        'Bienvenido a Guesnime!',
                        style: TextStyle(
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
              SizedBox(height: 4), // Espacio entre el logo y los campos
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
                  decoration: const InputDecoration(
                    labelText: 'Nombre de usuario',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Espacio entre los campos y el botón
              ElevatedButton(
                onPressed: () async {
                  // Crear un nuevo usuario
                  Usuario usuario = Usuario(
                    nombre: _usernameController.text,
                    estrellas: 0,
                    nivelesExitososNaruto: 0,
                    nivelesTotalesNaruto: 8,
                    nivelesExitososKimetsu: 0,
                    nivelesTotalesKimetsu: 8,
                    nivelesExitososDBZ: 0,
                    nivelesTotalesDBZ: 8,
                    nivelesTotalesFMA: 8,
                    nivelesExitososFMA: 0,
                  );
                  await BaseDeDatos.insertarUsuario(usuario);

                  // Obtener la lista de usuarios de la base de datos
                  //List<Usuario> usuarios = await BaseDeDatos.getUsuarios();

                  // Guardar el nombre de usuario en SharedPreferences
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('usuario', usuario.nombre);

                  // Imprimir un mensaje de depuración en la consola
                  //print('Usuario insertado en la base de datos: $usuario');

                  // Guardar la bandera de usuario registrado en SharedPreferences
                  await prefs.setBool('userRegistered', true);

                  // Redirigir al usuario a la pantalla de inicio
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text('Registrar nombre'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
