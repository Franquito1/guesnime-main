import 'package:flutter/material.dart';
import 'package:guesnime/LevelPage.dart';


class LevelsPage extends StatefulWidget {
  final String levelImage;

  LevelsPage({required this.levelImage});

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
    'LevelImage/level5.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: levels.asMap().entries.map((entry) {
                int index = entry.key;
                  String levelImageUrl = levelImageUrls[index]; // Agregar esta línea
                return Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LevelPage(levelImage: levelImageUrl),
                        ),
                      );
                    },
                    child: Text((index + 1).toString()),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
     ),
);
}
}