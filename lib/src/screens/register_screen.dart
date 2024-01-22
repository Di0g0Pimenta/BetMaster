import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../widgets/inputBox.dart';
import '../services/api.service.dart';
import '../screens/login_screen.dart'; // Importe a tela de login ou a tela que você deseja exibir após o registro bem-sucedido

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ApiService apiService = ApiService();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF444A73),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double availableHeight = constraints.maxHeight;
            double inputBoxTop1 = availableHeight * 0.301;
            double inputBoxTop2 = availableHeight * 0.460;
            double inputBoxTop3 = availableHeight * 0.610;
            double buttonTop = availableHeight * 0.796;

            return Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: availableHeight * 0.15,
                  child: Image.asset(
                    'lib/src/assets/logos/BetMaster_Logo_Color.png',
                    width: 300,
                    height: 100,
                  ),
                ),
                Positioned(
                  top: inputBoxTop1,
                  child: _buildTextField('Nome', 'Enter your name', nameController),
                ),
                Positioned(
                  top: inputBoxTop2,
                  child: _buildTextField('Email', 'Enter your email', emailController),
                ),
                Positioned(
                  top: inputBoxTop3,
                  child: _buildTextField('Password', 'Enter your password', passwordController),
                ),
                Positioned(
                  top: buttonTop,
                  child: CustomButton(
                    buttonText: 'Register',
                    onPressed: () async {
                      // Obtenha os valores dos campos de entrada
                      String username = nameController.text;
                      String email = emailController.text;
                      String password = passwordController.text;

                      // Adicione aqui validações apropriadas antes de chamar o método de registro

                      // Chame o método de registro do ApiService
                      final result = await apiService.register(username, email, password);

                      if (result['success']) {
                        print('Registro bem-sucedido!');
                        
                        // Redirecione para a tela de login
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      } else {
                        print('Falha no registro: ${result['error']}');
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hintText, TextEditingController controller) {
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
        const SizedBox(height: 17),
        CustomInputWidget(
          hintText: hintText,
          controller: controller,
        ),
      ],
    );
  }
}
