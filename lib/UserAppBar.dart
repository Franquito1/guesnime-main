import 'package:flutter/material.dart';
import 'package:guesnime/EstrellasProvider.dart';
import 'package:provider/provider.dart';

class UserAppBar extends StatelessWidget {
  final String usuario;

  UserAppBar({required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -20,
          top: -65,
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
      ],
    );
  }
}