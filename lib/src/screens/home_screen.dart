// home_screen.dart

import 'package:flutter/material.dart';
import '../widgets/navbargames.dart'; // Substitua "path_para_seu_widget" pelo caminho real

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:  Color(0xFF444A73),
      body: Padding(
        padding: EdgeInsets.only(top: 120.0),
        child: NavigationBarGames(),
      ),
    );
  }
}
