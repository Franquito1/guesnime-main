import 'package:flutter/material.dart';
import 'package:guesnime/BaseDeDatos.dart';
import 'package:guesnime/EstrellasProvider.dart';
import 'package:guesnime/NivelesExistososProvider.dart';
import 'package:guesnime/SelectLevelsPage.dart';
import 'package:guesnime/SelectLevelsKimetsu.dart' as Kimetsu;
import 'package:guesnime/SelectLevelsDragon.dart' as DBZ;
import 'package:guesnime/SelectLevelsMetal.dart' as FMA;
import 'package:guesnime/Usuario.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UserAppBar.dart';

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
  int _nivelesTotalesDBZ = 0;
  int _nivelesExitososDBZ = 0;
  int _nivelesTotalesFMA = 0;
  int _nivelesExitososFMA = 0;

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
      print(
          'Nombre: ${usuario.nombre}, estrellas: ${usuario.estrellas}, niveles exitosos de Naruto: ${usuario.nivelesExitososNaruto}, niveles totales de Naruto: ${usuario.nivelesTotalesNaruto}, niveles exitosos de Kimetsu No Yaiba: ${usuario.nivelesExitososKimetsu}, niveles totales de Kimetsu No Yaiba: ${usuario.nivelesTotalesKimetsu}, niveles exitosos de Dragon Ball Z: ${usuario.nivelesExitososDBZ}, niveles totales de Dragon Ball Z: ${usuario.nivelesTotalesDBZ}, niveles exitosos de FullMetal Alchemist: ${usuario.nivelesExitososFMA}, niveles totales de FullMetal Alchemist: ${usuario.nivelesTotalesFMA}');
    }

    int estrellas = await BaseDeDatos.getEstrellas(usuario);
    setState(() {
      _estrellas = estrellas;
    });

    int nivelesExitososNaruto =
        await BaseDeDatos.getNivelesExitososNaruto(usuario);
    int nivelesTotalesNaruto =
        await BaseDeDatos.getNivelesTotalesNaruto(usuario);
    int nivelesExitososKimetsu =
        await BaseDeDatos.getNivelesExitososKimetsu(usuario);
    int nivelesTotalesKimetsu =
        await BaseDeDatos.getNivelesTotalesKimetsu(usuario);
    int nivelesExitososDBZ = await BaseDeDatos.getNivelesExitososDBZ(usuario);
    int nivelesTotalesDBZ = await BaseDeDatos.getNivelesTotalesDBZ(usuario);
    int nivelesExitososFMA = await BaseDeDatos.getNivelesExitososFMA(usuario);
    int nivelesTotalesFMA = await BaseDeDatos.getNivelesTotalesFMA(usuario);

    void updateNivelesExitososNaruto() {
      setState(() {
        _nivelesExitososNaruto++;
      });
    }

    void updateNivelesExitososKimetsu() {
      setState(() {
        _nivelesExitososKimetsu++;
      });
    }

    setState(() {
      _nivelesExitososNaruto = nivelesExitososNaruto;
      _nivelesTotalesNaruto = nivelesTotalesNaruto;
      _nivelesExitososKimetsu = nivelesExitososKimetsu;
      _nivelesTotalesKimetsu = nivelesTotalesKimetsu;
      _nivelesExitososDBZ = nivelesExitososDBZ;
      _nivelesTotalesDBZ = nivelesTotalesDBZ;
      _nivelesExitososFMA = nivelesExitososFMA;
      _nivelesTotalesFMA = nivelesTotalesFMA;
    });
  }

  @override
  Widget build(BuildContext context) {
    int nivelesExitososNaruto = Provider.of<NivelesExitososProvider>(context)
        .getNivelesExitosos('Naruto');
    int nivelesExitososKimetsu = Provider.of<NivelesExitososProvider>(context)
        .getNivelesExitosos('Kimetsu');
    int nivelesExitososDBZ =
        Provider.of<NivelesExitososProvider>(context).getNivelesExitosos('DBZ');
    int nivelesExitososFMA =
        Provider.of<NivelesExitososProvider>(context).getNivelesExitosos('FMA');
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF394065),
        ),
        child: Stack(
          children: [
            UserAppBar(usuario: _usuario),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectLevelsPage(
                            usuario: _usuario,
                            estrellas: Provider.of<StarsProvider>(context,
                                    listen: false)
                                .stars,
                            levelImage: 'assets/defaul_image.png',
                            levelAnswer: 'Naruto',
                            anime: 'Naruto',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 202, 202,
                            202), // Color de fondo de la barra de personajes de Naruto
                        borderRadius:
                            BorderRadius.circular(25.0), // Borde redondeado
                      ),
                      width: 320, // Ancho de la barra
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
                                    color: Color.fromARGB(255, 62, 59, 59),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                    width:
                                        10), // Espacio entre el nombre y el logo de Naruto
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
                                  '$nivelesExitososNaruto/$_nivelesTotalesNaruto',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 62, 59, 59),
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
                  const SizedBox(
                      height: 30), // Espacio entre las barras de personajes
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Kimetsu.SelectLevelsKimetsu(
                            usuario: _usuario,
                            estrellas: Provider.of<StarsProvider>(context,
                                    listen: false)
                                .stars,
                            levelImage: 'assets/defaul_image.png',
                            levelAnswer: 'KimetsuNoYaiba',
                            anime: 'Kimetsu',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 202, 202,
                            202), // Color de fondo de la barra de personajes de Kimetsu No Yaiba
                        borderRadius:
                            BorderRadius.circular(25.0), // Borde redondeado
                      ),
                      width:
                          320, // Ancho de la barra de personajes de Kimetsu No Yaiba (ajusta según tus necesidades)
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
                                    color: Color.fromARGB(255, 62, 59, 59),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                    width:
                                        10), // Espacio entre el nombre y la imagen de Kimetsu No Yaiba
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
                                  '$nivelesExitososKimetsu/$_nivelesTotalesKimetsu',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 62, 59, 59),
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
                  const SizedBox(
                      height: 30), // Espacio entre las barras de personajes
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DBZ.SelectLevelsDragon(
                            usuario: _usuario,
                            estrellas: Provider.of<StarsProvider>(context,
                                    listen: false)
                                .stars,
                            levelImage: 'assets/defaul_image.png',
                            levelAnswer: 'Dragon Ball Z',
                            anime: 'DBZ',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 202, 202,
                            202), // Color de fondo de la barra de personajes de Kimetsu No Yaiba
                        borderRadius:
                            BorderRadius.circular(25.0), // Borde redondeado
                      ),
                      width:
                          320, // Ancho de la barra de personajes de Kimetsu No Yaiba (ajusta según tus necesidades)
                      height: 50, // Alto de la barra
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  'Dragon Ball Z',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 62, 59, 59),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Image.asset(
                                  'assets/esferadbz.png',
                                  height: 60,
                                  width: 40,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  '$nivelesExitososDBZ/$_nivelesTotalesDBZ',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 62, 59, 59),
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
                  const SizedBox(
                      height: 30), // Espacio entre las barras de personajes
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FMA.SelectLevelsMetal(
                            usuario: _usuario,
                            estrellas: Provider.of<StarsProvider>(context,
                                    listen: false)
                                .stars,
                            levelImage: 'assets/defaul_image.png',
                            levelAnswer: 'FullMetal Alchemist',
                            anime: 'FMA',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 202, 202, 202),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      width: 320,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  'FullMetal Alchemist',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 62, 59, 59),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Image.asset(
                                  'assets/fullmetal.png',
                                  height: 60,
                                  width: 60,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  '$nivelesExitososFMA/$_nivelesTotalesFMA',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 62, 59, 59),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
