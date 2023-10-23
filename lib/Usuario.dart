class Usuario {
  String nombre;
  int estrellas;
  int nivelesExitososNaruto;
  int nivelesTotalesNaruto;
  int nivelesExitososKimetsu;
  int nivelesTotalesKimetsu;

  Usuario({
    required this.nombre,
    required this.estrellas,
    required this.nivelesExitososNaruto,
    required this.nivelesTotalesNaruto,
    required this.nivelesExitososKimetsu,
    required this.nivelesTotalesKimetsu,
  });

  // Constructor que convierte un mapa en un objeto Usuario
  Usuario.fromMap(Map<String, dynamic> map)
      : nombre = map['nombre'],
        estrellas = map['estrellas'],
        nivelesExitososNaruto = map['nivelesExitososNaruto'],
        nivelesTotalesNaruto = map['nivelesTotalesNaruto'],
        nivelesExitososKimetsu = map['nivelesExitososKimetsu'],
        nivelesTotalesKimetsu = map['nivelesTotalesKimetsu'];

  // Método que convierte un objeto Usuario en un mapa
  Map<String, dynamic> toMap() => {
        'nombre': nombre,
        'estrellas': estrellas,
        'nivelesExitososNaruto': nivelesExitososNaruto,
        'nivelesTotalesNaruto': nivelesTotalesNaruto,
        'nivelesExitososKimetsu': nivelesExitososKimetsu,
        'nivelesTotalesKimetsu': nivelesTotalesKimetsu,
      };
}
