import 'package:flutter/material.dart';
import 'package:guesnime/BaseDeDatos.dart';
import 'package:guesnime/SelectLevelsPage.dart';
import 'package:guesnime/Usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _usuario = '';
  int _estrellas = 0;
  int _nivelesExitososNaruto = 0;
  int _nivelesTotalesNaruto = 0;
  int _nivelesExitososKimetsu = 0;
  int _nivelesTotalesKimetsu = 0;

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
  //print('Lista de usuarios registrados:');
  // ignore: unused_local_variable
  for (var usuario in usuarios) {
    //print('Nombre: ${usuario.nombre}, estrellas: ${usuario.estrellas}, niveles exitosos de Naruto: ${usuario.nivelesExitososNaruto}, niveles totales de Naruto: ${usuario.nivelesTotalesNaruto}, niveles exitosos de Kimetsu No Yaiba: ${usuario.nivelesExitososKimetsu}, niveles totales de Kimetsu No Yaiba: ${usuario.nivelesTotalesKimetsu}');
  }

   int estrellas = await BaseDeDatos.getEstrellas(usuario);
    setState(() {
      _estrellas = estrellas;
    });

  int nivelesExitososNaruto = await BaseDeDatos.getNivelesExitososNaruto(usuario);
  int nivelesTotalesNaruto = await BaseDeDatos.getNivelesTotalesNaruto(usuario);
  int nivelesExitososKimetsu = await BaseDeDatos.getNivelesExitososKimetsu(usuario);
  int nivelesTotalesKimetsu = await BaseDeDatos.getNivelesTotalesKimetsu(usuario);

  setState(() {
    _nivelesExitososNaruto = nivelesExitososNaruto;
    _nivelesTotalesNaruto = nivelesTotalesNaruto;
    _nivelesExitososKimetsu = nivelesExitososKimetsu;
    _nivelesTotalesKimetsu = nivelesTotalesKimetsu;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF394065),
        ),
        child: Stack(
          children: [
            Positioned(
              left: -20, // Ajusta la posición izquierda para el logo
              top: -65, // Ajusta la posición superior para el logo
              child: Image.asset(
                'assets/guesnimelogo.png',
                height: 325, // Ajusta el alto del logo
                width: 189, // Ajusta el ancho del logo
              ),
            ),
            Positioned(
              left: 134, // Ajusta la posición izquierda para la barra de usuario
              right: 10,
              top: 69, // Ajusta la posición superior para la barra de usuario
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 202, 202, 202), // Color de fondo de la barra de usuario
                  borderRadius: BorderRadius.circular(25.0), // Borde redondeado
                ),
                width: 200, // Ancho de la barra de usuario
                height: 50, // Alto de la barra de usuario
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            ' $_usuario',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            ' $_estrellas',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 334, // Ajusta la posición izquierda para la estrella
              top: 67, // Ajusta la posición superior para la estrella (misma que la barra de usuario)
              child: Image.asset(
                'assets/Estrella.png',
                height: 50, // Ajusta el alto de la estrella (mismo que el logo)
                width: 50, // Ajusta el ancho de la estrella (mismo que el logo)
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                  onTap: (){
                      Navigator.push(
                          context,
            MaterialPageRoute(
              builder: (context) => SelectLevelsPage( 
                usuario: _usuario,
                estrellas: _estrellas,
                levelImage: 'assets/defaul_image.png',
                levelAnswer: 'Naruto',
                ),
                             ), 
                      );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 202, 202, 202), // Color de fondo de la barra de personajes de Naruto
                      borderRadius: BorderRadius.circular(25.0), // Borde redondeado
                    ),
                    width: 320, // Ancho de la barra de personajes de Naruto (ajusta según tus necesidades)
                    height: 50, // Alto de la barra
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text(
                                'Naruto',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 10), // Espacio entre el nombre y el logo de Naruto
                              Image.asset(
                                'assets/narutokunai.png', // Ruta de la imagen de Naruto
                                height: 24, // Ajusta el alto de la imagen
                                width: 24, // Ajusta el ancho de la imagen
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                '$_nivelesExitososNaruto/$_nivelesTotalesNaruto',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ),
                  const SizedBox(height: 30), // Espacio entre las barras de personajes
                  Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 202, 202, 202), // Color de fondo de la barra de personajes de Kimetsu No Yaiba
                          borderRadius: BorderRadius.circular(25.0), // Borde redondeado
                        ),
                        width: 320, // Ancho de la barra de personajes de Kimetsu No Yaiba (ajusta según tus necesidades)
                        height: 50, // Alto de la barra
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    'Kimetsu No Yaiba',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 10), // Espacio entre el nombre y la imagen de Kimetsu No Yaiba
                                  Image.asset(
                                    'assets/inosuke.png', // Ruta de la imagen de Kimetsu No Yaiba
                                    height: 60, // Ajusta el alto de la imagen
                                    width: 40, // Ajusta el ancho de la imagen
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    '$_nivelesExitososKimetsu/$_nivelesTotalesKimetsu',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}