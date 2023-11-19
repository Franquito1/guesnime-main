import 'package:flutter/material.dart';
import 'package:guesnime/BaseDeDatos.dart';
import 'package:guesnime/EstrellasProvider.dart';
import 'package:guesnime/LevelPage.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class SelectLevelsKimetsu extends StatefulWidget {
  final String levelImage;
  final String levelAnswer;
  final String usuario;


  SelectLevelsKimetsu({required this.levelImage, required this.levelAnswer,required this.usuario, required estrellas});

  @override
  _SelectLevelsKimetsu createState() => _SelectLevelsKimetsu();
  
}




class _SelectLevelsKimetsu extends State<SelectLevelsKimetsu> {
  List<int> levels = [1, 2, 3, 4, 5];
  List<String> levelImageUrls = [
    'assets/LevelImageKimetsu/level1.png',
    'assets/LevelImageKimetsu/level2.png',
    'assets/LevelImageKimetsu/level3.png',
    'assets/LevelImageKimetsu/level4.png',
    'assets/LevelImageKimetsu/level5.png',
  ];
  List<String> levelAnswers = [
    'Tanjiro',
    'Nezuko',
    'Inosuke',
    'Zenitsu',
    'Hinatsuru',
  ];

  List<bool> levelCompleted = List.generate(5, (index) => false);

  
  @override
  Widget build(BuildContext context) {
    final String levelImage = widget.levelImage;
    String _usuario = widget.usuario;
 

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
                        '${Provider.of<StarsProvider>(context).stars}',
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
          left: 322,
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
                bool isCompleted = index < Provider.of<StarsProvider>(context).stars;
                print('Level $index is completed: $isCompleted');
                return GestureDetector(
                  onTap: () {
                    if (!isCompleted || index < levelImageUrls.length && index < levelAnswers.length) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LevelPage(
                              levelImage: levelImageUrls[index],
                              levelAnswer: levelAnswers[index],
                              levelIndex: levels[index],
                              usuario: widget.usuario, 
                              onLevelComplete: () {
                                setState(() {
                                  levelCompleted[index] = true;
                                });
                              },
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
                     color: levelCompleted[index] ? Colors.green : Colors.white,
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


