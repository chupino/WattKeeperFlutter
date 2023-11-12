import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattkeeper/components/general/textfield.dart';
import 'package:wattkeeper/components/general/emailtextformfield.dart';
import 'package:wattkeeper/components/login&register/button.dart';
import 'package:wattkeeper/components/login&register/passwordField.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';
import 'package:wattkeeper/core/helpers/validators/EmailValidator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo_icon.png'),
            const SizedBox(
              height: 25,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  EmailTextFormField(
                    validator: (value) {
                      return EmailValidator.validate(emailController.text)!;
                    },
                    hintText: 'Correo',
                    labelText: 'Correo',
                    icon: Icons.email,
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PasswordField(
                    hintText: 'Contraseña',
                    labelText: 'Contraseña',
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Introduzca su contraseña';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      LoginButton(
                        formKey: formKey,
                        emailController: emailController,
                        passwordController: passwordController,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                text: 'No tienes cuenta? ',
                style: TextStyles.textH5,
                children: [
                  TextSpan(
                      text: 'Crea una',
                      style: TextStyles.textH5.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed('/register');
                        }),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
