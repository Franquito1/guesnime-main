import 'package:flutter/material.dart';
import 'package:guesnime/BaseDeDatos.dart';
import 'package:guesnime/EstrellasProvider.dart';
import 'package:guesnime/NivelesExistososProvider.dart';
import 'package:guesnime/UserAppBar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LevelPage extends StatefulWidget {
  final String levelImage;
  final String levelAnswer;
  final String usuario;
  final String anime;

  LevelPage(
      {required this.levelImage,
      required this.levelAnswer,
      required this.usuario,
      required this.anime});

  @override
  // ignore: library_private_types_in_public_api
  _LevelPageState createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  late String _usuario;
  late int _estrellas;
  static const int estrellasParaRevelarRespuesta = 5;
  bool _respuestaRevelada = false;
  late String correctAnswer;
  final TextEditingController _answerController = TextEditingController();
  late String levelImage1 = widget.levelImage;

  Future<void> updateSuccessfulLevelsInDatabase(
      String usuario, String anime) async {
    final db = await BaseDeDatos.getInstance();
    int successfulLevels;

    successfulLevels = (await db.rawQuery(
        'SELECT nivelesExitosos${anime} FROM usuarios WHERE nombre = ?',
        [usuario]))[0]['nivelesExitosos${anime}'] as int;
    successfulLevels++;
    await db.rawUpdate(
      'UPDATE usuarios SET nivelesExitosos${anime} = ? WHERE nombre = ?',
      [successfulLevels, usuario],
    );
    Provider.of<NivelesExitososProvider>(context, listen: false)
        .setNivelesExitosos(anime, successfulLevels);
  }

  Future<void> updateStarsInDatabase() async {
    final db = await BaseDeDatos.getInstance();
    _estrellas += 3;

    await db.rawUpdate(
      'UPDATE usuarios SET estrellas = ? WHERE nombre = ?',
      [_estrellas, _usuario],
    );
    Provider.of<StarsProvider>(context, listen: false).setStars(_estrellas);
  }

  @override
  void initState() {
    super.initState();
    _usuario = widget.usuario;
    _estrellas = Provider.of<StarsProvider>(context, listen: false).stars;
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  void saveCompletedLevel(String levelAnswer) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> completedLevels = prefs.getStringList('completedLevels') ?? [];
    completedLevels.add(levelAnswer);
    await prefs.setStringList('completedLevels', completedLevels);
  }

  Future<bool> checkAnswer() async {
    String userAnswer = _answerController.text;
    correctAnswer = widget.levelAnswer;

    if (userAnswer.toLowerCase() == correctAnswer.toLowerCase()) {
      await updateSuccessfulLevelsInDatabase(
          _usuario, widget.anime); // Añade esta línea
      if (!_respuestaRevelada) {
        await updateStarsInDatabase();
      }
      saveCompletedLevel(correctAnswer);
      return true;
    } else {
      if (_respuestaRevelada) {
        print('Estrellas antes: $_estrellas');
        setState(() {
          _estrellas -= _LevelPageState.estrellasParaRevelarRespuesta;
        });
        Provider.of<StarsProvider>(context, listen: false)
            .setStars(_estrellas); // Update the stars in the provider
        print('Estrellas después: $_estrellas');
      }
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  const SizedBox(height: 20),
                  // Imagen del nivel
                  Container(
                    width: 280, // Ajusta el ancho de la imagen del nivel
                    height: 280, // Ajusta el alto de la imagen del nivel
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(levelImage1),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Entrada de texto
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _answerController,
                      decoration: const InputDecoration(
                        hintText: 'Ingresa tu respuesta',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Botón "Enviar"
                  ElevatedButton(
                    onPressed: () {
                      checkAnswer().then((correct) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            if (correct) {
                              return AlertDialog(
                                title: const Text('¡Correcto!'),
                                content: const Text('¡Has acertado!'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context, {
                                        'estrellas': _estrellas,
                                        'nivelCompletado': correctAnswer
                                      });
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            } else {
                              return AlertDialog(
                                title: const Text('¡Incorrecto!'),
                                content: const Text('Inténtalo de nuevo'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            }
                          },
                        );
                      });
                    },
                    child: const Text('Revisar respuesta'),
                  ),
                  const SizedBox(height: 20),
                  // Botón "Revelar respuesta"
                  ElevatedButton(
                    onPressed: () {
                      print('Estrellas: $_estrellas');
                      print(
                          'Estrellas para revelar respuesta: ${_LevelPageState.estrellasParaRevelarRespuesta}');

                      if (_estrellas >=
                          _LevelPageState.estrellasParaRevelarRespuesta) {
                        setState(() {
                          _estrellas -=
                              _LevelPageState.estrellasParaRevelarRespuesta;
                          _respuestaRevelada = true;
                        });
                        Provider.of<StarsProvider>(context, listen: false)
                            .setStars(
                                _estrellas); // Update the stars in the provider

                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Respuesta'),
                              content:
                                  Text('La respuesta es ${widget.levelAnswer}'),
                            );
                          },
                        );
                      } else if (_respuestaRevelada) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Text('Respuesta ya revelada'),
                              content: Text(
                                  'Ya has revelado la respuesta para este nivel'),
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Text('No suficientes estrellas'),
                              content: Text(
                                  'No tienes suficientes estrellas para revelar la respuesta'),
                            );
                          },
                        );
                      }
                    },
                    child: const Text('Revelar respuesta'),
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
