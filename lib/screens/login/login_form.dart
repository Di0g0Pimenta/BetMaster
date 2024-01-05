import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:betmaster/widgets/button.dart';
import 'package:betmaster/widgets/inputbox.dart';
import 'package:betmaster/screens/register/register_screen.dart';
import 'package:betmaster/screens/home/home_screen.dart';
import 'package:betmaster/services/api_service.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ApiService apiService = ApiService(); // Sem necessidade de fornecer o URL novamente

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
            CustomInputBox(
              hintText: "Enter your email",
              controller: usernameController,
            ),
            const SizedBox(height: 30),
            _buildText("Password"),
            const SizedBox(height: 15),
            CustomInputBox(
              hintText: "Enter your password",
              controller: passwordController,
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                print('Forgot password link clicked!');
              },
              child: const Text(
                "Forgot your password?",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF86E1FC),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Login',
              onPressed: () async {
                final username = usernameController.text;
                final password = passwordController.text;

                try {
                  // Exemplo de uso para login
                  final loginData = {'username': username, 'password': password};
                  final loginResult = await apiService.request('/auth/login', method: 'GET');

                  print('Login successful: $loginResult');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } catch (e) {
                  print('Login failed: $e');
                }
              },
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "You don’t have an account? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: "Sign Up",
                    style: const TextStyle(
                      color: Color(0xFFFF5370),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w900,
                      height: 0,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                        print('Sign Up link clicked!');
                      },
                  ),
                ],
              ),
            ),
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
        fontFamily: "Roboto",
        fontWeight: FontWeight.w400,
        color: Color(0xFFD0D0D0),
      ),
    );
  }
}
