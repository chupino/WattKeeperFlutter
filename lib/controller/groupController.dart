import 'dart:convert';

import 'package:get/get.dart';
import 'package:wattkeeper/core/constants/urls.dart';
import 'package:http/http.dart' as http;
import 'package:wattkeeper/models/Group.dart';

class GroupController extends GetxController {
  Future<List<Group>> getGroupsUser(String token, String selectedGroup) async {
    try {
      String group = "grupos_creados";
      switch (selectedGroup) {
        case "Mis Grupos":
          group = "grupos_creados";
          break;
        case "Grupos Afiliados":
          group = "grupos_afiliado";
          break;
        default:
          group = "grupos_creados";
      }
      final String url = "${Urls.backendDjango}/api/grupos";
      final response = await http
          .get(Uri.parse(url), headers: {"Authorization": "token $token"});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<Group> grupos = (data['data'][group] as List)
            .map((element) => Group.fromJson(element as Map<String, dynamic>))
            .toList();
        print(grupos);
        return grupos;
      } else {
        throw "Error al recuperar informacion de grupos";
      }
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }
}
