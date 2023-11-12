import 'package:get/get.dart';
import 'package:wattkeeper/core/constants/urls.dart';

class Device {
  int id, usuario;
  int? tiempoMedicion;
  String nombre,
      descripcion,
      tamagochi,
      direccionMac,
      limiteConsumo,
      tipoMedicion;

  Device(
      {required this.id,
      required this.usuario,
      required this.tiempoMedicion,
      required this.nombre,
      required this.descripcion,
      required this.tamagochi,
      required this.direccionMac,
      required this.limiteConsumo,
      required this.tipoMedicion});

  String getTamagochiImage() {
    return "${Urls.backendDjango}/media/tamagochi_dispositivos/$tamagochi";
  }

  factory Device.fromJson(Map<String, dynamic> data) {
    return Device(
        id: data['id'],
        usuario: data['usuario'],
        tiempoMedicion: data['tiempo_medicion'],
        nombre: data['nombre'],
        descripcion: data['descripcion'] == ''
            ? 'No se agrego Descripcion'
            : data['descripcion'],
        tamagochi: data['tamagochi'],
        direccionMac: data['direccion_mac'],
        limiteConsumo: data['limite_consumo'] ?? 'No Hay',
        tipoMedicion: data['tipo_medicion'] ?? 'No Hay');
  }
}
