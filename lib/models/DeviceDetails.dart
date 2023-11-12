import 'package:wattkeeper/core/constants/urls.dart';

class DeviceDetails {
  int? tiempoMedicion;
  bool enabled;
  double limiteConsumo;
  String nombre, descripcion, tamagochi, direccionMac, tipoMedicion;

  DeviceDetails(
      {required this.tiempoMedicion,
      required this.nombre,
      required this.descripcion,
      required this.tamagochi,
      required this.direccionMac,
      required this.enabled,
      required this.limiteConsumo,
      required this.tipoMedicion});

  String getTamagochiImage() {
    return "${Urls.backendDjango}/media/tamagochi_dispositivos/$tamagochi";
  }

  factory DeviceDetails.fromJson(Map<String, dynamic> data) {
    return DeviceDetails(
        tiempoMedicion: data['limitacion']['tiempo_medicion'],
        nombre: data['nombre'],
        descripcion: data['descripcion'] == ''
            ? 'No se agrego Descripcion'
            : data['descripcion'],
        tamagochi: data['tamagochi'],
        enabled: data['limitacion']['enabled'],
        direccionMac: data['direccion_mac'],
        limiteConsumo: data['limitacion']['limite_consumo'] ?? 0,
        tipoMedicion: data['limitacion']['tipo_medicion'] ?? 'No Hay');
  }
}
