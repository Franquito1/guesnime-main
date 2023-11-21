import 'package:flutter/material.dart';
import 'package:guesnime/BaseDeDatos.dart';
import 'package:guesnime/EstrellasProvider.dart';
import 'package:guesnime/LevelPage.dart';
import 'package:guesnime/UserAppBar.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectLevelsMetal extends StatefulWidget {
  final String levelImage;
  final String levelAnswer;
  final String usuario;
  final String anime;

  SelectLevelsMetal(
      {required this.levelImage,
      required this.levelAnswer,
      required this.usuario,
      required estrellas,
      required this.anime});

  @override
  _SelectLevelsMetal createState() => _SelectLevelsMetal();
}

class _SelectLevelsMetal extends State<SelectLevelsMetal> {
  List<int> levels = [1, 2, 3, 4, 5, 6, 7, 8];
  List<String> levelImageUrls = [
    'assets/LevelImageMetal/level1.png',
    'assets/LevelImageMetal/level2.png',
    'assets/LevelImageMetal/level3.png',
    'assets/LevelImageMetal/level4.png',
    'assets/LevelImageMetal/level5.png',
    'assets/LevelImageMetal/level6.png',
    'assets/LevelImageMetal/level7.png',
    'assets/LevelImageMetal/level8.png',
  ];
  List<String> levelAnswers = [
    'Edward Elric',
    'Roy Mustang',
    'Alphonse Elric',
    'Winry Rockbell',
    'King Bradley',
    'Greed FullMetal',
    'Nina Tucker',
    'Maes Hughes'
  ];

  List<String> completedLevels = [];

  @override
  void initState() {
    super.initState();
    loadCompletedLevels();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadCompletedLevels();
  }

  void loadCompletedLevels() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      completedLevels = prefs.getStringList('completedLevels') ?? [];
    });
  }

  void saveCompletedLevel(String levelAnswer) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> completedLevels = prefs.getStringList('completedLevels') ?? [];
    completedLevels.add(levelAnswer);
    await prefs.setStringList('completedLevels', completedLevels);
  }

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
            UserAppBar(usuario: _usuario),
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
                        onTap: () async {
                          if (index < levelImageUrls.length &&
                              index < levelAnswers.length &&
                              !completedLevels.contains(levelAnswers[index])) {
                            Map<String, dynamic> result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LevelPage(
                                      levelImage: levelImageUrls[index],
                                      levelAnswer: levelAnswers[index],
                                      usuario: widget.usuario,
                                      anime: 'FMA');
                                },
                              ),
                            );
                            if (result != null) {
                              setState(() {
                                completedLevels.add(result['nivelCompletado']);
                              });
                            }
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          width: 50, // Width of the white box
                          height: 50, // Height of the white box
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${levels[index]}',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (completedLevels
                                    .contains(levelAnswers[index]))
                                  Icon(Icons.check_circle, color: Colors.green),
                              ],
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
