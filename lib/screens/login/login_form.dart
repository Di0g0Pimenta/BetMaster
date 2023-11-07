import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Email",
              style: TextStyle(
                fontSize: 24,
                fontFamily: "Argentum Sans",
                fontWeight: FontWeight.w400,
                color: Color(0xFFD0D0D0),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity, // Define a largura para ocupar o espaço disponível
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: const Color(0xFFD0D0D0)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.white),
                  // Adicione controlador para capturar o valor do campo de entrada
                  // controller: _emailController,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Password",
              style: TextStyle(
                fontSize: 24,
                fontFamily: "Argentum Sans",
                fontWeight: FontWeight.w400,
                color: Color(0xFFD0D0D0),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity, // Define a largura para ocupar o espaço disponível
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: const Color(0xFFD0D0D0)),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  obscureText: true, // Para ocultar a senha
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.white),
                  // Adicione controlador para capturar o valor do campo de entrada
                  // controller: _passwordController,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Forgot your password?",
              style: TextStyle(
                fontSize: 13,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w300,
                color: Color(0xFF86E1FC),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
