import 'package:daacos_website/responsive/desktop.dart';
import 'package:daacos_website/responsive/mobile.dart';
import 'package:daacos_website/responsive/responsive.dart';
import 'package:daacos_website/responsive/tablette.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Accueil - Daacos Digi-com Agency",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Manrope",
      ),
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: ResponsiveLayout(
        mobile: MobileRender(),
        tablette: TabletteRender(),
        desktop: DesktopRender(),
      ),
    );
  }
}
