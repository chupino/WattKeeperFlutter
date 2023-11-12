import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattkeeper/components/general/emailtextformfield.dart';
import 'package:wattkeeper/components/general/textformfield.dart';
import 'package:wattkeeper/components/login&register/button.dart';
import 'package:wattkeeper/components/login&register/buttonRegister.dart';
import 'package:wattkeeper/components/login&register/datepickerfield.dart';
import 'package:wattkeeper/components/login&register/passwordField.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordConfirmController =
        TextEditingController();
    final TextEditingController fecNacController = TextEditingController();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
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
                    CustomTextFormField(
                      hintText: 'Nombre',
                      labelText: 'Nombre',
                      controller: nameController,
                      icon: Icons.person,
                      textInputType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      hintText: 'Apellido',
                      labelText: 'Apellido',
                      controller: lastNameController,
                      icon: Icons.person_2,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DatePickerTextField(
                        hintText: 'Fecha de Nacimiento',
                        labelText: 'Fecha de Nacimiento',
                        icon: Icons.date_range,
                        textInputType: TextInputType.datetime,
                        controller: fecNacController),
                    const SizedBox(
                      height: 10,
                    ),
                    EmailTextFormField(
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
                        } else if (value.length < 8) {
                          return 'Su contraseña es muy corta';
                        }else if (value.compareTo(passwordConfirmController.text) !=
                            0) {
                          return 'La contraseña no coincide';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PasswordField(
                      hintText: 'Contraseña',
                      labelText: 'Contraseña',
                      controller: passwordConfirmController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Introduzca su contraseña';
                        } else if (value.length < 8) {
                          return 'Su contraseña es muy corta';
                        } else if (value.compareTo(passwordController.text) !=
                            0) {
                          return 'La contraseña no coincide';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        RegisterButton(
                          formKey: formKey,
                          emailController: emailController,
                          passwordController: passwordController,
                          nameController: nameController,
                          lastNameController: lastNameController,
                          fecNacController: fecNacController,
                          passwordConfirmController: passwordConfirmController,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
