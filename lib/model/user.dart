
class Usuario {
  final String Nombre;
  final String Hora;

  Usuario({required this.Nombre, required this.Hora});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(Nombre: json['Nombre'], Hora: json['Hora']);
  }
}