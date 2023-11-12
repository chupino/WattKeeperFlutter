import 'package:flutter/material.dart';
import 'package:wattkeeper/components/groups/groupCard.dart';
import 'package:wattkeeper/components/home/consejo.dart';
import 'package:wattkeeper/components/home/groupSection.dart';
import 'package:wattkeeper/components/home/welcome.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';
import 'package:wattkeeper/models/User.dart';

class HomeScheme extends StatelessWidget {
  final String token;
  const HomeScheme({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WelcomeHome(token: token),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Tus Grupos",
          style: TextStyles.textH1.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        GroupSection(token: token),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Consejo del día",
          style: TextStyles.textH1.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        const ConsejoCard(
            consejo:
                "Aunque la tv este apagada, siempre que este enchufada consume energía eléctrica")
      ],
    );
  }
}
