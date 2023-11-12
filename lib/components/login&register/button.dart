import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wattkeeper/controller/sessionController.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class LoginButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController, passwordController;
  const LoginButton(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.formKey});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool isLoggining = false;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SessionController());
    return Expanded(
      child: !isLoggining
          ? ElevatedButton(
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 20)),
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromARGB(255, 1, 33, 59))),
              onPressed: () async {
                if (widget.formKey.currentState!.validate()) {
                  setState(() {
                    isLoggining = true;
                  });
                  await controller
                      .login(widget.emailController.text,
                          widget.passwordController.text)
                      .then((value) {
                    Get.snackbar('Sesión Iniciada', value,
                        snackPosition: SnackPosition.BOTTOM);
                    Get.toNamed('/navBarHome');
                  }).catchError((value) {
                    Get.snackbar('Ocurrio algo', value,
                        snackPosition: SnackPosition.BOTTOM);
                  });
                  setState(() {
                    isLoggining = false;
                  });
                } else {
                  null;
                }
              },
              child: const Text(
                'Iniciar Sesión',
                style: TextStyles.textH3,
              ))
          : ElevatedButton(
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(14)),
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromARGB(255, 1, 33, 59))),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    'assets/animations/loginLoading3.json',
                    height: 50,
                  ),
                  const Text(
                    'Iniciando Sesión...',
                    style: TextStyles.textH3,
                  ),
                ],
              )),
    );
  }
}
