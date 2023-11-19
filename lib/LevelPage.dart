import 'package:flutter/material.dart';
import 'package:guesnime/BaseDeDatos.dart';
import 'package:guesnime/EstrellasProvider.dart';
import 'package:guesnime/UserAppBar.dart';
import 'package:provider/provider.dart';

class LevelPage extends StatefulWidget {
  final String levelImage;
  final String levelAnswer;
  final String usuario;


  LevelPage({required this.levelImage, required this.levelAnswer, required this.usuario});
  

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

void checkAnswer() async {
  String userAnswer = _answerController.text;
  String correctAnswer = widget.levelAnswer;
  
  if (userAnswer.toLowerCase() == correctAnswer.toLowerCase()) {
    await updateStarsInDatabase();

        setState(() {
      _estrellas = _estrellas;
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


