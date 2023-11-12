import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wattkeeper/components/account/header.dart';
import 'package:wattkeeper/components/general/button.dart';
import 'package:wattkeeper/components/general/textfield.dart';
import 'package:wattkeeper/components/login&register/datepickerfield.dart';
import 'package:wattkeeper/controller/sessionController.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';
import 'package:wattkeeper/models/User.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late String token;
  bool isInitialized = false;
  Future<void> initAsync() async {
    token = await controller.getToken();
    print(token);
    setState(() {
      isInitialized = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAsync();
  }

  final controller = Get.put(SessionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const HeaderAccount(),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: isInitialized
                ? FutureBuilder(
                    future: controller.getDataUser(token),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: Lottie.asset(
                              'assets/animations/loginLoading3.json'),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        final User user = snapshot.data!;
                        final TextEditingController nameController =
                            TextEditingController(text: user.nombres);
                        final TextEditingController emailController =
                            TextEditingController(text: user.email);
                        final TextEditingController lastnameController =
                            TextEditingController(text: user.apellidos);
                        final TextEditingController fecNacController =
                            TextEditingController(
                                text: user.getFormatedFecNac());
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldCustom(
                                hintText: 'Nombre',
                                labelText: 'Nombre',
                                controller: nameController,
                                icon: Icons.person),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFieldCustom(
                              hintText: 'Apellidos',
                              labelText: 'Apellidos',
                              icon: Icons.person_4,
                              controller: lastnameController,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFieldCustom(
                              hintText: 'Correo',
                              labelText: 'Correo',
                              icon: Icons.email,
                              controller: emailController,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            DatePickerTextField(
                              hintText: 'Fecha de Nacimiento',
                              controller: fecNacController,
                              icon: Icons.date_range,
                              labelText: 'Fecha de Nacimiento',
                              textInputType: TextInputType.datetime,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                      text: 'Cerrar Sesión',
                                      onPressed: () {
                                        controller.logout(token).then((value) {
                                          Get.snackbar('Sesion Cerrada',
                                              'La sesión se cerro correctamente',snackPosition: SnackPosition.BOTTOM);
                                          Get.toNamed('/login');
                                        });
                                      }),
                                ),
                              ],
                            )
                          ],
                        );
                      } else {
                        print(snapshot.error);
                        return const Text("Algo ocurrio brutalmente mal");
                      }
                    })
                : Center(
                    child:
                        LottieBuilder.asset('assets/animations/loading3.json')),
          ),
        )
      ],
    ));
  }
}
