import 'package:flutter/material.dart';
import '../widgets/navbargames.dart';
import '../widgets/main_nabvar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF444A73),
      body: Column(
        children: [
          Expanded(
            child: Container(
              // Conteúdo da parte expandida aqui...
              padding: EdgeInsets.only(top: 70.0), // Ajuste a posição vertical aqui
              child: NavigationBarGames(), // Adicionando o widget NavigationBarGames
            ),
          ),
          MyBottomNavigationBar(),
        ],
      ),
    );
  }
}
