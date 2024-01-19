import 'package:flutter/material.dart';
import 'src/screens/splash_screen.dart'; // Importe a Splash Screen

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seu App',
      home: SplashScreen(), // Exiba a Splash Screen primeiro
    );
  }
}
