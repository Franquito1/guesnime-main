import 'package:flutter/material.dart';

class LevelPage extends StatefulWidget {
  final String levelImage;

  LevelPage({required this.levelImage});

  @override
  _LevelPageState createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  String _usuario = 'Nombre de Usuario'; // Debes obtener el nombre de usuario desde donde lo tengas guardado
  int _estrellas = 0;

  @override
  Widget build(BuildContext context) {
    final String levelImage = widget.levelImage;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF394065),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.centerRight,
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
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 202, 202, 202),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    width: 200,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ' $_usuario',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ' $_estrellas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
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
              onPressed: () {},
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
}
}