import 'package:wattkeeper/core/constants/urls.dart';

class Group {
  int id, creador;
  String nombre, descripcion, tamagochi;
  String? limiteConsumo, tipoMedicion;
  int? tiempoMedicion;
  List usuarios;
  List dispositivos;

  Group(
      {required this.tamagochi,
      required this.tipoMedicion,
      required this.tiempoMedicion,
      required this.limiteConsumo,
      required this.id,
      required this.creador,
      required this.nombre,
      required this.descripcion,
      required this.dispositivos,
      required this.usuarios});
    String getTamagochiImage() {
    return "${Urls.backendDjango}/media/tamagochi_dispositivos/$tamagochi";
  }
  factory Group.fromJson(Map<String, dynamic> data) {
    return Group(
      id: data["id"],
      creador: data["creador"],
      nombre: data["nombre"],
      descripcion: data["descripcion"],
      dispositivos: data["dispositivos"],
      usuarios: data["usuarios"],
      tamagochi: data["tamagochi"],
      tipoMedicion: data["tipo_medicion"] ?? "No tiene",
      tiempoMedicion: data["tiempo_medicion"] ?? 0,
      limiteConsumo: data["limite_consumo"] ?? "No tiene",
    );
  }
}
