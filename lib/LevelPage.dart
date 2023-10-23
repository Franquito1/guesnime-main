import 'package:flutter/material.dart';

class LevelPage extends StatefulWidget {
  final String levelImage;
  
  final String levelAnswer;

  LevelPage({required this.levelImage, required this.levelAnswer});

  @override
  _LevelPageState createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  String _usuario = 'Nombre de Usuario'; // Debes obtener el nombre de usuario desde donde lo tengas guardado
  int _estrellas = 0;
  final TextEditingController _answerController = TextEditingController();

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
            title: Text('¡Correcto!'),
            content: Text('¡Has acertado!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
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
            title: Text('Incorrecto'),
            content: Text('Inténtalo de nuevo'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String levelImage = widget.levelImage;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
                            style: TextStyle(
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
                            style: TextStyle(
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
                  const SizedBox(height: 20),
            // Imagen del nivel
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/$levelImage'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 20),
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
                decoration: InputDecoration(
                  hintText: 'Ingresa tu respuesta',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Botón "Enviar"
            ElevatedButton(
              onPressed: checkAnswer,
              child: Text('Enviar'),
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