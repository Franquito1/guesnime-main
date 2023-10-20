class Usuario {
  int id;
  String nombre;
  String contrasena;
  String correo;
  int noEstrellas;

  Usuario({
    required this.id,
    required this.nombre,
    required this.contrasena,
    required this.correo,
    required this.noEstrellas,
  });

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      nombre: map['nombre'],
      contrasena: map['contrasena'],
      correo: map['correo'],
      noEstrellas: map['noEstrellas'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'contraseña': contrasena,
      'correo': correo,
      'noEstrellas': noEstrellas,
    };
  }
}