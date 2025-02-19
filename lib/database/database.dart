import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';

class Database {
  static Color primary = Color(0xFFF9AE06);
  static Color secondary = Color(0xFF0C1533);
  static double borderrad = 5;

//boder desktop
  static double defaultmargin = 300;

  //textstyle
  static Color textColor = Colors.white;
  static TextStyle titleStyle = TextStyle(
    fontSize: 55,
    color: Colors.white,
  );

  //services cards content

  static List<String> services = [
    "Communication Digitale",
    "Applications Web et Mobiles ",
    "Infrastructure IT",
    "Marketing Digital",
    "Formation",
    "Gestion de projet",
  ];

  static List descriptions = [
    "Nous vous accompagnons dans la mise en place de votre stratégie de communication digitale.",
    "Nous développons des applications mobiles android, ios sur mesure pour répondre à vos besoins.",
    "Développement et maintenance de parcs informatiques, systèmes de gestion sécurisés.",
    "Nous vous accompagnons dans la mise en place de votre stratégie de marketing digital.",
    "Nous vous proposons des formations sur mesure pour répondre à vos besoins.",
    "Nous vous accompagnons dans la mise en place de votre stratégie de communication digitale.",
  ];

  static List icondata = [
    Icons.deblur,
    AntIcons.codepenOutlined,
    AntIcons.cloudServerOutlined,
    Icons.markunread_mailbox,
    Icons.school,
    Icons.lightbulb_outline
  ];
  //services cards
  static Widget serviceCard(String title, String content, String image) {
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.circular(borderrad),
      ),
      child: Column(
        children: [
          Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderrad),
                topRight: Radius.circular(borderrad),
              ),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }

//spacer
  static Widget spacer1 = SizedBox(
    height: 30,
  );
  static Widget spacer2 = SizedBox(
    height: 5,
  );

  static TextStyle h2 = TextStyle(
    fontSize: 40,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
}

class PageTitles {
  static const String home = "Accueil - Daacos Digicom Agency";
  static const String about = "À propos - Daacos Digicom Agency";
  static const String services = "Services - Daacos Digicom Agency";
  static const String contact = "Contact - Daacos Digicom Agency";
  static const String portfolio = "Portfolio - Daacos Digicom Agency";
}
