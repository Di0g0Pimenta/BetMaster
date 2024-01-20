// navigation_bar_games.dart

import 'package:flutter/material.dart';

class NavigationBarGames extends StatefulWidget {
  const NavigationBarGames({Key? key}) : super(key: key);

  @override
  _NavigationBarGamesState createState() => _NavigationBarGamesState();
}

class _NavigationBarGamesState extends State<NavigationBarGames> {
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
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
              _buildNavigationButton(0, "lib/src/assets/logos/cs.png"),
              _buildNavigationButton(1, "lib/src/assets/logos/lol.png"),
              _buildNavigationButton(2, "lib/src/assets/logos/dota.png"),
            ],
          ),
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: [
              Container(color: const Color(0xFF444A73), child: const Center(child: Text("CS"))),
              Container(color: const Color(0xFF444A73), child: const Center(child: Text("LoL"))),
              Container(color: const Color(0xFF444A73), child: const Center(child: Text("Dota"))),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationButton(int index, String imageUrl) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        width: 122,
        height: 46,
        decoration: ShapeDecoration(
          color: _selectedIndex == index ? const Color(0xFFFF5370) : const Color(0x003E68D7),
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
