class Niveles {
  int id;
  String anime;
  String personaje;
  String imagen;

  Niveles({
    required this.id,
    required this.anime,
    required this.personaje,
    required this.imagen,
  });

  factory Niveles.fromMap(Map<String, dynamic> map) {
    return Niveles(
      id: map['id'],
      anime: map['anime'],
      personaje: map['personaje'],
      imagen: map['imagen'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'anime': anime,
      'personaje': personaje,
      'imagen': imagen,
    };
  }
}