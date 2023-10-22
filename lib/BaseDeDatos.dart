import 'package:sqflite/sqflite.dart';

import 'Usuario.dart';

class BaseDeDatos {
  static Database? _database;

  static Future<Database> getInstance() async {
    if (_database == null) {
      _database = await openDatabase('bd.db',
          version: 1, onCreate: (db, version) async {
        await db.execute('CREATE TABLE usuarios ('
            'nombre TEXT PRIMARY KEY,'
            'Estrellas INTEGER NOT NULL)');
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

  static Future<int> eliminarUsuario(String nombre) async {
    final db = await getInstance();

    final int filasAfectadas =
        await db.delete('usuarios', where: 'nombre = ?', whereArgs: [nombre]);

    if (filasAfectadas == 0) {
      throw Exception('El usuario no existe');
    }

    return filasAfectadas;
  }
}