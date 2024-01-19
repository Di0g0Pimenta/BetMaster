import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../widgets/inputBox.dart';

class RegisterScreen extends StatelessWidget {
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
                // Adiciona o logotipo aqui
                Positioned(
                  top: availableHeight * 0.15, // Ajuste a posição conforme necessário
                  child: Image.asset(
                    'lib/src/assets/logos/BetMaster_Logo_Color.png',
                    width: 300, // Ajuste a largura conforme necessário
                    height: 100, // Ajuste a altura conforme necessário
                  ),
                ),
                Positioned(
                  top: inputBoxTop1,
                  child: _buildTextField('Nome', 'Enter your name'),
                ),
                Positioned(
                  top: inputBoxTop2,
                  child: _buildTextField('Email', 'Enter your email'),
                ),
                Positioned(
                  top: inputBoxTop3,
                  child: _buildTextField('Password', 'Enter your password'),
                ),
                Positioned(
                  top: buttonTop,
                  child: CustomButton(
                    buttonText: 'Register',
                    onPressed: () {
                      // Lógica de submit aqui
                      print('Botão Submit pressionado!');
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
        const SizedBox(height: 17),
        CustomInputWidget(
          hintText: hintText,
          controller: TextEditingController(),
        ),
      ],
    );
  }
}
