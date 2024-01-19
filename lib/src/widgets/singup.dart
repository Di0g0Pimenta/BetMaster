import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo à tela de cadastro!',
              style: TextStyle(fontSize: 20),
            ),
            // Adicione os campos de cadastro ou outros widgets necessários aqui
          ],
        ),
      ),
    );
  }
}
