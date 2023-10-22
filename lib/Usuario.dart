class Usuario {
  String nombre;
  int Estrellas;

  Usuario({
    required this.nombre,
    required this.Estrellas,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'Estrellas': Estrellas,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      nombre: map['nombre'],
      Estrellas: map['Estrellas'],
    );
  }

  @override
  String toString() {
    return 'Usuario{nombre: $nombre, Estrellas: $Estrellas}';
  }
}