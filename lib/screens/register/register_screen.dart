import 'package:flutter/material.dart';
import 'package:betmaster/screens/register/register_form.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF444A73),
        child: Stack(
          children: [
            Positioned(
              top: 130,
              right: 65,
              left: 65,
              child: Image.asset(
                'assets/logos/BetMaster_Logo_Color.png',
                width: 300,
                height: 100,
              ),
            ),
            Positioned(
              top: 272,
              left: 24,
              right: 24,
              child: Center(
                child: RegisterForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
