import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _usuario = 'Nombre de Usuario'; // Debes obtener el nombre de usuario desde donde lo tengas guardado
  int _estrellas = 0;

  @override
  Widget build(BuildContext context) {
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
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 202, 202, 202), // Color de fondo de la barra de personajes de Naruto
                      borderRadius: BorderRadius.circular(25.0), // Borde redondeado
                    ),
                    width: 320, // Ancho de la barra de personajes de Naruto (ajusta según tus necesidades)
                    height: 50, // Alto de la barra
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Naruto',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10), // Espacio entre el nombre y el logo de Naruto
                              Image.asset(
                                'assets/narutokunai.png', // Ruta de la imagen de Naruto
                                height: 24, // Ajusta el alto de la imagen
                                width: 24, // Ajusta el ancho de la imagen
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                '1/20',
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
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 202, 202, 202), // Color de fondo de la barra de personajes de Kimetsu No Yaiba
                      borderRadius: BorderRadius.circular(25.0), // Borde redondeado
                    ),
                    width: 320, // Ancho de la barra de personajes de Kimetsu No Yaiba (ajusta según tus necesidades)
                    height: 50, // Alto de la barra
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Kimetsu No Yaiba',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10), // Espacio entre el nombre y el logo de Kimetsu No Yaiba
                              Image.asset(
                                'assets/inosuke.png', // Ruta de la imagen de Kimetsu No Yaiba
                                height: 24, // Ajusta el alto de la imagen
                                width: 24, // Ajusta el ancho de la imagen
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                '1/20',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}                             
