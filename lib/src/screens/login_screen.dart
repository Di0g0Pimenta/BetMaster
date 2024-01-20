import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../widgets/inputBox.dart';
import '../widgets/singup.dart';
import '../screens/register_screen.dart';
import '../screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF444A73),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double availableHeight = constraints.maxHeight;
            double inputBoxTop1 = availableHeight * 0.391;
            double inputBoxTop2 = availableHeight * 0.550;
            double buttonTop = availableHeight * 0.746;

            return Stack(
              alignment: Alignment.center,
              children: [
                // Adicione a imagem do logo aqui
                Positioned(
                  top: 100,
                  child: Image.asset(
                    'lib/src/assets/logos/BetMaster_Logo_Color.png',
                    width: 300,
                    height: 100,
                  ),
                ),
                Positioned(
                  top: inputBoxTop1,
                  child: _buildTextField('Email', 'Enter your username'),
                ),
                Positioned(
                  top: inputBoxTop2,
                  child: _buildTextField('Password', 'Enter your password'),
                ),
                Positioned(
                  top: buttonTop,
                  child: Column(
                    children: [
                      CustomButton(
                        buttonText: 'Login',
                        onPressed: () {
                          // Lógica de login aqui
                          // Navegar para a tela HomeScreen após o login
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          // Navegar para a tela de cadastro ao clicar em "Sign Up"
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterScreen()),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFFD0D0D0),
              fontSize: 24,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 17), // Adicionado espaçamento vertical entre a label e a input box
        CustomInputWidget(
          hintText: hintText,
          controller: TextEditingController(),
        ),
      ],
    );
  }
}
