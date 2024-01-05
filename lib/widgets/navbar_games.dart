import 'package:flutter/material.dart';

class NavigationBarGames extends StatefulWidget {
    const NavigationBarGames({Key? key}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<NavigationBarGames> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382,
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 2),
      decoration: ShapeDecoration(
        color: const Color(0x003E68D7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavigationButton(0, "assets/logos/cs.png"),
          _buildNavigationButton(1, "assets/logos/lol.png"),
          _buildNavigationButton(2, "assets/logos/dota.png"),
        ],
      ),
    );
  }

  Widget _buildNavigationButton(int index, String imageUrl) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        // Aqui você pode adicionar lógica para exibir informações diferentes
        // com base no botão pressionado.
        // Por exemplo, você pode trocar entre diferentes páginas, widgets, etc.
      },
      child: Container(
        width: 122,
        height: 46,
        decoration: ShapeDecoration(
          color:
              _selectedIndex == index ? const Color(0xFFFF5370) : const Color(0x003E68D7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: _selectedIndex == index ? 35 : 30,
              height: _selectedIndex == index ? 35 : 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
