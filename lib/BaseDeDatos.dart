import 'package:sqflite/sqflite.dart';

import 'Usuario.dart';

class BaseDeDatos {
  static Database? _database;

  static Future<Database> getInstance() async {
    if (_database == null) {
      _database = await openDatabase('bd.db',
          version: 1, onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE usuarios (
            nombre TEXT PRIMARY KEY,
            estrellas INTEGER NOT NULL,
            nivelesExitososNaruto INTEGER,
            nivelesTotalesNaruto INTEGER,
            nivelesExitososKimetsu INTEGER,
            nivelesTotalesKimetsu INTEGER
          )
        ''');

        await db.execute('CREATE TABLE niveles ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'anime TEXT NOT NULL,'
            'personaje TEXT NOT NULL,'
            'imagen TEXT NOT NULL)');

      });
    }

    return _database!;
  }

  static Future<List<Usuario>> getUsuarios() async {
    final db = await getInstance();
    final List<Map<String, dynamic>> usuariosMap = await db.query('usuarios');

    return usuariosMap.map((map) => Usuario.fromMap(map)).toList();
  }

  static Future<Usuario?> getUsuarioPorNombre(String nombre) async {
    final db = await getInstance();
    final List<Map<String, dynamic>> usuariosMap = await db.query('usuarios',
        where: 'nombre = ?', whereArgs: [nombre]);

    if (usuariosMap.isNotEmpty) {
      return Usuario.fromMap(usuariosMap[0]);
    } else {
      return null;
    }
  }

  static Future<int> getEstrellas(String nombreUsuario) async {
    final db = await getInstance();
    final List<Map<String, dynamic>> usuariosMap = await db.query('usuarios',
        where: 'nombre = ?', whereArgs: [nombreUsuario]);

    if (usuariosMap.isNotEmpty) {
      Usuario usuario = Usuario.fromMap(usuariosMap[0]);
      return usuario.estrellas;
    } else {
      throw Exception('Usuario no encontrado');
    }
  }

  static Future<int> insertarUsuario(Usuario usuario) async {
    final db = await getInstance();

    return await db.insert('usuarios', usuario.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> actualizarUsuario(Usuario usuario) async {
    final db = await getInstance();

    return await db.update('usuarios', usuario.toMap(),
        where: 'nombre = ?', whereArgs: [usuario.nombre]);
  }

    static Future<int> getNivelesExitososNaruto(String nombreUsuario) async {
    final db = await getInstance();
    final List<Map<String, dynamic>> usuariosMap = await db.query('usuarios',
        columns: ['nivelesExitososNaruto'],
        where: 'nombre = ?',
        whereArgs: [nombreUsuario]);

    if (usuariosMap.isNotEmpty) {
      return usuariosMap[0]['nivelesExitososNaruto'] as int;
    } else {
      throw Exception('Usuario no encontrado');
    }
  }

   static Future<int> getNivelesTotalesNaruto(String nombreUsuario) async {
    final db = await getInstance();
    final List<Map<String, dynamic>> usuariosMap = await db.query('usuarios',
        columns: ['nivelesTotalesNaruto'],
        where: 'nombre = ?',
        whereArgs: [nombreUsuario]);

    if (usuariosMap.isNotEmpty) {
      return usuariosMap[0]['nivelesTotalesNaruto'] as int;
    } else {
      throw Exception('Usuario no encontrado');
    }
  }

   static Future<int> getNivelesExitososKimetsu(String nombreUsuario) async {
    final db = await getInstance();
    final List<Map<String, dynamic>> usuariosMap = await db.query('usuarios',
        columns: ['nivelesExitososKimetsu'],
        where: 'nombre = ?',
        whereArgs: [nombreUsuario]);

    if (usuariosMap.isNotEmpty) {
      return usuariosMap[0]['nivelesExitososKimetsu'] as int;
    } else {
      throw Exception('Usuario no encontrado');
    }
  }

   static Future<int> getNivelesTotalesKimetsu(String nombreUsuario) async {
    final db = await getInstance();
    final List<Map<String, dynamic>> usuariosMap = await db.query('usuarios',
        columns: ['nivelesTotalesKimetsu'],
        where: 'nombre = ?',
        whereArgs: [nombreUsuario]);

    if (usuariosMap.isNotEmpty) {
      return usuariosMap[0]['nivelesTotalesKimetsu'] as int;
    } else {
      throw Exception('Usuario no encontrado');
    }
  }



}
