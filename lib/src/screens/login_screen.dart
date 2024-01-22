import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../widgets/inputbox.dart';
import '../screens/register_screen.dart';
import '../screens/home_screen.dart';
import '../services/api.service.dart'; // Importe o serviço de API

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ApiService _apiService = ApiService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

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
                _buildLogo(),
                _buildTextField('Username', 'Enter your username', inputBoxTop1, _emailController),
                _buildTextField('Password', 'Enter your password', inputBoxTop2, _passwordController),
                _buildButtons(buttonTop, context),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Positioned(
      top: 100,
      child: Image.asset(
        'lib/src/assets/logos/BetMaster_Logo_Color.png',
        width: 300,
        height: 100,
      ),
    );
  }

  Widget _buildTextField(String label, String hintText, double topPosition, TextEditingController controller) {
    return Positioned(
      top: topPosition,
      child: _buildTextFieldContainer(label, hintText, controller),
    );
  }

  Widget _buildTextFieldContainer(String label, String hintText, TextEditingController controller) {
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
      SizedBox(height: 17),
      CustomInputWidget(
        hintText: hintText,
        controller: controller,
        isPassword: label.toLowerCase() == 'password', // Check if the label is 'Password'
      ),
    ],
  );
}

  Widget _buildButtons(double buttonTop, BuildContext context) {
    return Positioned(
      top: buttonTop,
      child: Column(
        children: [
          CustomButton(
            buttonText: 'Login',
            onPressed: () async {
              final Map<String, dynamic> result = await _apiService.login(
                _emailController.text,
                _passwordController.text,
              );

              if (result['success']) {
                // Use the authentication token for further API requests
                print('Authentication Token: ${_apiService.authToken}');

                // Navigate to the HomeScreen or perform other actions
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              } else {
                setState(() {
                  _errorMessage = result['error'];
                });
              }
            },
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              // Navega para a tela de cadastro ao clicar em "Sign Up"
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
          if (_errorMessage.isNotEmpty)
            // Exibe a mensagem de erro se houver
            Text(
              _errorMessage,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}
