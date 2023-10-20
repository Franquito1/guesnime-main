import 'package:sqflite/sqflite.dart';

import 'Usuario.dart';

class BaseDeDatos {
  static Database? _database;

  static Future<Database> getInstance() async {
    if (_database == null) {
      _database = await openDatabase('base_de_datos.db',
          version: 1, onCreate: (db, version) async {
            await db.execute('CREATE TABLE usuarios ('
                'id INTEGER PRIMARY KEY AUTOINCREMENT,'
                'nombre TEXT NOT NULL,'
                'contraseña TEXT NOT NULL,'
                'correo TEXT NOT NULL,'
                'noEstrellas INTEGER NOT NULL)');

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

  static Future<Usuario?> getUsuarioPorId(int id) async {
    final db = await getInstance();
    final List<Map<String, dynamic>> usuariosMap = await db.query('usuarios',
        where: 'id = ?', whereArgs: [id]);

    if (usuariosMap.isNotEmpty) {
      return Usuario.fromMap(usuariosMap[0]);
    } else {
      return null;
    }
  }

  static Future<int> insertarUsuario(Usuario usuario) async {
    final db = await getInstance();

    return await db.insert('usuarios', usuario.toMap());
  }

  static Future<int> actualizarUsuario(Usuario usuario) async {
    final db = await getInstance();

    return await db.update('usuarios', usuario.toMap(),
        where: 'id = ?', whereArgs: [usuario.id]);
  }

  static Future<int> eliminarUsuario(int id) async {
    final db = await getInstance();

    final int filasAfectadas = await db.delete('usuarios', where: 'id = ?', whereArgs: [id]);

    if (filasAfectadas == 0) {
      throw Exception('El usuario no existe');
    }

    return filasAfectadas;
  }

}