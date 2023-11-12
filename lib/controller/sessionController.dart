import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wattkeeper/core/constants/urls.dart';
import 'package:wattkeeper/models/User.dart';

class SessionController extends GetxController {
  Future<String> login(String email, String password) async {
    try {
      print("email: $email, password: $password");
      final String endPointLogin = "${Urls.backendDjango}/api/login";
      final response = await http.post(Uri.parse(endPointLogin),
          body: {"email": email, "password": password});
      final data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data["token"];
        saveToken(token);
        saveLogin();
        return 'Sesión Iniciada Correctamente';
      } else {
        return 'Comprueba tus Credenciales';
      }
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }

  Future<String> register(
      String email,
      String nombres,
      String apellidos,
      String password,
      String passwordConfirmation,
      String fechaNacimiento) async {
    try {
      print(
          "email:$email\npassword: $password\npasswordConfirmation: $passwordConfirmation\nnombres:$nombres\napellidos: $apellidos\nfechaNacimiento: $fechaNacimiento");
      DateTime parsedDate =
          DateFormat('dd MMMM y', 'es').parse(fechaNacimiento);
      String fechaNacFinal = DateFormat('yyyy-MM-dd').format(parsedDate);
      final String url = "${Urls.backendDjango}/api/register";
      final response = await http.post(Uri.parse(url), body: {
        "nombres": nombres,
        "apellidos": apellidos,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "fecha_nacimiento": fechaNacFinal
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data["token"];
        saveToken(token);
        saveLogin();
        return "Cuenta creada con exito";
      } else {
        return "Ocurrio un error al crear la cuenta";
      }
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }

  Future<bool> logout(String token) async {
    try {
      final String url = "${Urls.backendDjango}/api/logout";
      final response = await http
          .post(Uri.parse(url), headers: {"Authorization": "token $token"});
      if (response.statusCode == 204) {
        print(response.body);
        deleteToken(token);
        deleteLogin();
        return true;
      } else {
        print(response.body);
        throw "Error al recuperar informacion";
      }
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<void> deleteToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") ?? "";
  }

  Future<void> saveLogin() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogged', true);
  }

  Future<void> deleteLogin() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogged', false);
  }

  Future<User> getDataUser(String token) async {
    try {
      final String url = "${Urls.backendDjango}/api/user";
      final response = await http
          .get(Uri.parse(url), headers: {"Authorization": "token $token"});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return User.fromJson(data['data']['usuario']);
      } else {
        throw "Error al recuperar informacion de Usuario";
      }
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }
}
