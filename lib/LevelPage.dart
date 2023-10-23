// ignore: file_names
import 'package:flutter/material.dart';

class LevelPage extends StatefulWidget {
  final String levelImage;
  final String levelAnswer;
  final String usuario;
  final int estrellas;


  const LevelPage({super.key, required this.levelImage, required this.levelAnswer, required this.usuario, required this.estrellas});
  

  @override
  // ignore: library_private_types_in_public_api
  _LevelPageState createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> 
{
  late String _usuario;
  late int _estrellas;
  final TextEditingController _answerController = TextEditingController();
  late String levelImage1 = widget.levelImage;

  @override
  void initState() {
    super.initState();
    _usuario = widget.usuario;
    _estrellas = widget.estrellas;
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();  
  }

  void checkAnswer() {
    String userAnswer = _answerController.text;
    String correctAnswer = widget.levelAnswer;
    if (userAnswer.toLowerCase() == correctAnswer.toLowerCase()) {
      setState(() {
        _estrellas += 1;
      });
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('¡Correcto!'),
            content: const Text('¡Has acertado!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, _estrellas);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Incorrecto'),
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
        },
      );
    }
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
          left: -20,
          top: -80, // Ajusta la posición superior para la imagen
          child: Image.asset(
            'assets/guesnimelogo.png',
            height: 325,
            width: 189,
          ),
        ),
        Positioned(
          left: 134,
          right: 10,
          top: 69,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 202, 202, 202),
              borderRadius: BorderRadius.circular(25.0),
            ),
            width: 200,
            height: 50,
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
          left: 334,
          top: 67,
          child: Image.asset(
            'assets/Estrella.png',
            height: 50,
            width: 50,
          ),
        ),
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
                onPressed: checkAnswer,
                child: const Text('Enviar'),
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


