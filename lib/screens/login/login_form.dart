import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    final String apiUrl = 'http://localhost:3000/api/auth/login';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': usernameController.text.trim(), // Utilize 'username' aqui
        'password': passwordController.text.trim(),
      }),
    );

    if (response.statusCode == 200) {
      // Login bem-sucedido, manipule o token ou navegue para a próxima tela
      print('Login bem-sucedido! Token: ${json.decode(response.body)['token']}');
    } else {
      // Lidar com falha no login
      print('Login falhou. Código de status: ${response.statusCode}');
      print('Corpo da resposta: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildText("Email"),
            const SizedBox(height: 15),
            _buildInputField(controller: usernameController),
            const SizedBox(height: 30),
            _buildText("Password"),
            const SizedBox(height: 15),
            _buildPasswordField(controller: passwordController),
            const SizedBox(height: 8),
            _buildForgotPasswordText(),
            const SizedBox(height: 20),
            _buildLoginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontFamily: "Argentum Sans",
        fontWeight: FontWeight.w400,
        color: Color(0xFFD0D0D0),
      ),
    );
  }

  Widget _buildInputField({required TextEditingController controller}) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: _inputFieldDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildPasswordField({required TextEditingController controller}) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: _inputFieldDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: controller,
          obscureText: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  BoxDecoration _inputFieldDecoration() {
    return BoxDecoration(
      border: Border.all(width: 2, color: const Color(0xFFD0D0D0)),
      borderRadius: BorderRadius.circular(15),
    );
  }

  Widget _buildForgotPasswordText() {
    return const Text(
      "Forgot your password?",
      style: TextStyle(
        fontSize: 13,
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w300,
        color: Color(0xFF86E1FC),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _login(context),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFFFF5370),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            'Login',
            style: TextStyle(
              color: Color(0xFFD0D0D0),
              fontSize: 32,
              fontFamily: 'Argentum Sans',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ),
      ),
    );
  }
}
