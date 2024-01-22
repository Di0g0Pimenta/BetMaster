import 'package:flutter/material.dart';
import '../widgets/main_nabvar.dart'; // Substitua pelo caminho real

class BettingHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF444A73),
      body: Column(
        children: [
          // Adicione a label no top
          Container(
            padding: EdgeInsets.symmetric(vertical: 70, horizontal: 16),
            child: Text(
              'Betting History',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
          // Adicione o conteúdo da tela aqui...
          Expanded(
            child: Container(
              // Seu conteúdo aqui...
            ),
          ),
          // Adicione a barra de navegação inferior
          MyBottomNavigationBar(),
        ],
      ),
    );
  }
}