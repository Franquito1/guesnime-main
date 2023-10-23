import 'package:flutter/material.dart';
import 'package:guesnime/LevelPage.dart';

class LevelsPage extends StatefulWidget {
  final String levelImage;
  final String levelAnswer;

  LevelsPage({required this.levelImage, required this.levelAnswer});

  @override
  _LevelsPageState createState() => _LevelsPageState();
}

class _LevelsPageState extends State<LevelsPage> {
  List<int> levels = [1, 2, 3, 4, 5];
  List<String> levelImageUrls = [
    'LevelImage/level1.png',
    'LevelImage/level2.png',
    'LevelImage/level3.png',
    'LevelImage/level4.png',
    'LevelImage/level5.png',
  ];
  List<String> levelAnswers = [
    'Sakura',
    'Respuesta 2',
    'Respuesta 3',
    'Respuesta 4',
    'Respuesta 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Niveles'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF394065),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/guesnimelogo.png',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 10),
                Text(
                  'Selecciona el nivel que deseas jugar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: levels.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (index < levelImageUrls.length && index < levelAnswers.length) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LevelPage(
                            levelImage: levelImageUrls[index],
                            levelAnswer: levelAnswers[index],
                          ),
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
                        style: TextStyle(
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
    );
  }
}
