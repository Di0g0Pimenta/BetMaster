import 'package:flutter/material.dart';
import 'package:betmaster/Screens/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF444A73),
        child: Stack(
          children: [
            Positioned(
              top: 172.0,
              right: 65.0,
              left: 65.0,
              child: Image.asset(
                'assets/logos/BetMaster_Logo_Color.png',
                width: 300,
                height: 100,
              ),
            ),
            Positioned(
              top: 346.0, // Ajuste a posição conforme necessário
              left: 24,
              right: 24,
              child: Center(
                child: LoginForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

