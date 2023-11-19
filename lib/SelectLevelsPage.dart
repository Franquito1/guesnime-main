import 'package:flutter/material.dart';
import 'package:guesnime/BaseDeDatos.dart';
import 'package:guesnime/EstrellasProvider.dart';
import 'package:guesnime/LevelPage.dart';
import 'package:guesnime/UserAppBar.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class SelectLevelsPage extends StatefulWidget {
  final String levelImage;
  final String levelAnswer;
  final String usuario;

  SelectLevelsPage({required this.levelImage, required this.levelAnswer,required this.usuario, required estrellas});

  @override
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


