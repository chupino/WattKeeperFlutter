import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wattkeeper/core/constants/urls.dart';
import 'package:wattkeeper/models/Device.dart';
import 'package:wattkeeper/models/DeviceDetails.dart';

class DeviceController extends GetxController {
  Future<List<Device>> getDevicesUser(String token) async {
    try {
      final String url = "${Urls.backendDjango}/api/dispositivos";
      final response = await http
          .get(Uri.parse(url), headers: {"Authorization": "token $token"});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<Device> dispositivos = (data["data"]["dispositivos"] as List)
            .map((element) => Device.fromJson(element as Map<String, dynamic>))
            .toList();

        return dispositivos;
      } else {
        throw "Error al recuperar informacion de dispositivos";
      }
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }

  Future<DeviceDetails> getDeviceDetailsUser(String token, int id) async {
    try {
      final String url = "${Urls.backendDjango}/api/dispositivos/$id";
      final response = await http
          .get(Uri.parse(url), headers: {"Authorization": "token $token"});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        DeviceDetails dispositivo =
            DeviceDetails.fromJson(data['data']['dispositivo']);
        return dispositivo;
      } else {
        throw "Error al recuperar informacion de detalles de dispositivo";
      }
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }
}
