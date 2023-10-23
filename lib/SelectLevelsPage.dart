// ignore: file_names
import 'package:flutter/material.dart';
import 'package:guesnime/LevelPage.dart';

class SelectLevelsPage extends StatefulWidget {
  final String levelImage;
  final String levelAnswer;
  final String usuario;
  final int estrellas;

  const SelectLevelsPage({super.key, required this.levelImage, required this.levelAnswer,required this.usuario,required this.estrellas});

  @override
  // ignore: library_private_types_in_public_api
  _SelectLevelsPage createState() => _SelectLevelsPage();
  
}




class _SelectLevelsPage extends State<SelectLevelsPage> {
  List<int> levels = [1, 2, 3, 4, 5];
  List<String> levelImageUrls = [
    'assets/LevelImage/level1.png',
    'assets/LevelImage/level2.png',
    'assets/LevelImage/level3.png',
    'assets/LevelImage/level4.png',
    'assets/LevelImage/level5.png',
  ];
  List<String> levelAnswers = [
    'Sakura',
    'Minato',
    'Jiraiya',
    'Sasuke',
    'Sasori',
  ];
  
  
  @override
  Widget build(BuildContext context) {
    //final String levelImage = widget.levelImage;
    String usuario = widget.usuario;
  int estrellas = widget.estrellas;

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
                        ' $usuario',
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
                        ' $estrellas',
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
              const SizedBox(height: 50),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: levels.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (index < levelImageUrls.length && index < levelAnswers.length) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)  {
              
                           return LevelPage(
                            levelImage: levelImageUrls[index],
                            levelAnswer: levelAnswers[index],
                             usuario: widget.usuario, 
                             estrellas: widget.estrellas, 
                            );  
                          },
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    width: 50, // Width of the white box
                    height: 50, // Height of the white box
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '${levels[index]}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
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


