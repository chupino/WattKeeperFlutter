import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class NotificationCard extends StatelessWidget {
  final String mensajeNotificacion, titulo;
  final DateTime fechaNotificacion;
  const NotificationCard(
      {super.key,
      required this.mensajeNotificacion,
      required this.titulo,
      required this.fechaNotificacion});
  String tiempoTranscurrido(DateTime fecha) {
    final ahora = DateTime.now();
    final diferencia = ahora.difference(fecha);

    if (diferencia.inDays > 0) {
      final dias = diferencia.inDays;
      return "hace $dias ${dias == 1 ? 'd' : 'ds'}";
    } else if (diferencia.inHours > 0) {
      final horas = diferencia.inHours;
      return "hace $horas ${horas == 1 ? 'h' : 'hrs'}";
    } else if (diferencia.inMinutes > 0) {
      final minutos = diferencia.inMinutes;
      return "hace $minutos ${minutos == 1 ? 'm' : 'mins'}";
    } else {
      return "Ahora";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Get.theme.primaryColor,
      ),
      child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    titulo,
                    style:
                        TextStyles.textH4.copyWith(color: TextStyles.fontColor),
                  ),
                  Text(
                    " • ",
                    style:
                        TextStyles.textH4.copyWith(color: TextStyles.fontColor),
                  ),
                  Text(
                    tiempoTranscurrido(fechaNotificacion),
                    style: TextStyles.textH6
                        .copyWith(color: TextStyles.fontColor.withOpacity(0.5)),
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(mensajeNotificacion,
                  style: TextStyles.textH5
                      .copyWith(color: TextStyles.fontColor.withOpacity(0.8)))
            ],
          )),
    );
  }
}
