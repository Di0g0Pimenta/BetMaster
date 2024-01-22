import 'package:flutter/material.dart';
import '../screens/bettinghistory.dart';
import '../screens/home_screen.dart';
import '../screens/profile.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF444A73),
      selectedItemColor: Color(0xFFFF5370),
      unselectedItemColor: Colors.white,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;

          // Adicione a navegação para a página correta aqui
          switch (_currentIndex) {
            case 0:
              // Navegue para a página de histórico de apostas
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BettingHistoryScreen()),
              );
              break;
            case 1:
              // Navegue para a página inicial (Home)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
              break;
            case 2:
              // Navegue para a página de perfil
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              break;
          }
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          label: 'Bet History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}