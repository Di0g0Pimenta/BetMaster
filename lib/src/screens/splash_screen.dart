import 'package:flutter/material.dart';
import '../screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Defina o tempo de atraso em segundos
    const splashDuration = 2;

    // Use Future.delayed para criar um temporizador
    Future.delayed(const Duration(seconds: splashDuration), () {
      // Navegue para a tela de login após o tempo de atraso
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Color(0xFF444A73),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/src/assets/logos/BetMaster_Logo_Color.png',
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8 * 0.33,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
