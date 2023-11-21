class Usuario {
  String nombre;
  int estrellas;
  int nivelesExitososNaruto;
  int nivelesTotalesNaruto;
  int nivelesExitososKimetsu;
  int nivelesTotalesKimetsu;
  int nivelesExitososDBZ;
  int nivelesTotalesDBZ;
  int nivelesExitososFMA;
  int nivelesTotalesFMA;

  Usuario({
    required this.nombre,
    required this.estrellas,
    required this.nivelesExitososNaruto,
    required this.nivelesTotalesNaruto,
    required this.nivelesExitososKimetsu,
    required this.nivelesTotalesKimetsu,
    required this.nivelesExitososDBZ,
    required this.nivelesTotalesDBZ,
    required this.nivelesExitososFMA,
    required this.nivelesTotalesFMA,

  });

  // Constructor que convierte un mapa en un objeto Usuario
  Usuario.fromMap(Map<String, dynamic> map)
      : nombre = map['nombre'],
        estrellas = map['estrellas'],
        nivelesExitososNaruto = map['nivelesExitososNaruto'],
        nivelesTotalesNaruto = map['nivelesTotalesNaruto'],
        nivelesExitososKimetsu = map['nivelesExitososKimetsu'],
        nivelesTotalesKimetsu = map['nivelesTotalesKimetsu'],
        nivelesExitososDBZ = map['nivelesExitososDBZ'],
        nivelesTotalesDBZ = map['nivelesTotalesDBZ'],
        nivelesExitososFMA = map['nivelesExitososFMA'],
        nivelesTotalesFMA = map['nivelesTotalesFMA'];


  // Método que convierte un objeto Usuario en un mapa
  Map<String, dynamic> toMap() => {
        'nombre': nombre,
        'estrellas': estrellas,
        'nivelesExitososNaruto': nivelesExitososNaruto,
        'nivelesTotalesNaruto': nivelesTotalesNaruto,
        'nivelesExitososKimetsu': nivelesExitososKimetsu,
        'nivelesTotalesKimetsu': nivelesTotalesKimetsu,
        'nivelesExitososDBZ': nivelesExitososDBZ,
        'nivelesTotalesDBZ': nivelesTotalesDBZ,
        'nivelesExitososFMA': nivelesExitososFMA,
        'nivelesTotalesFMA': nivelesTotalesFMA,
      };

 void incrementarNivelesExitosos(String anime) {
    if (anime == 'Naruto') {
      nivelesExitososNaruto++;
    } else if (anime == 'Kimetsu') {
      nivelesExitososKimetsu++;
    }
    else if (anime == 'DBZ') {
      nivelesExitososDBZ++;
    }
    else if (anime == 'FMA') {
      nivelesExitososFMA++;
    }
  } 

}
