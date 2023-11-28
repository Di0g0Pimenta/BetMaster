import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 430,
        height: 932,
        decoration: const BoxDecoration(color: Color(0xFF444A73)),
        child: Stack(
          children: [
            _buildClock(),
            _buildLogo(),
            _buildForm(),
            _buildSignUpButton(),
            _buildOrLoginWith(),
            _buildSignUpLink(),
            _buildSocialIcons(),
          ],
        ),
      ),
    );
  }

  Widget _buildClock() {
    return Positioned(
      left: 24,
      top: 27,
      child: Container(
        width: 54,
        height: 21,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Center(
          child: Text(
            '9:41',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w600,
              letterSpacing: -0.41,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Positioned(
      left: 65,
      top: 98,
      child: Transform.rotate(
        angle: -0.13,
        child: Container(
          padding: const EdgeInsets.only(left: 15.20, right: 22.75, bottom: 0.06),
          child: Row(
            children: [
              Container(
                width: 253.89,
                height: 78,
                child: Stack(
                  children: [
                    _buildBetMasterText(),
                    _buildBetMasterLogo(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBetMasterText() {
    return const Positioned(
      left: 1.87,
      top: -0.25,
      child: Text(
        'BetMaster',
        style: TextStyle(
          fontSize: 62.55,
          fontFamily: 'Redwing',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildBetMasterLogo() {
    return Positioned(
      left: 26,
      top: 1,
      child: Container(
        width: 17,
        height: 12,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://via.placeholder.com/17x12"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Positioned(
      left: 24,
      top: 272,
      child: Container(
        child: Column(
          children: [
            _buildInputField('Name', 'Enter name...'),
            const SizedBox(height: 30),
            _buildInputField('Email', 'Enter email...'),
            const SizedBox(height: 30),
            _buildInputField('Password', 'Enter password...'),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hintText) {
    return Container(
      height: 95,
      child: Stack(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFD0D0D0),
              fontSize: 24,
              fontFamily: 'Argentum Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
          Positioned(
            top: 45,
            child: Container(
              width: 382,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2, color: Color(0xFFD0D0D0)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    hintText,
                    style: const TextStyle(
                      color: Color(0xFFD0D0D0),
                      fontSize: 24,
                      fontFamily: 'Argentum Sans',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Positioned(
      left: 24,
      top: 667,
      child: Container(
        width: 382,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFFFF5370),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Color(0xFFD0D0D0),
              fontSize: 24,
              fontFamily: 'Argentum Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrLoginWith() {
    return const Positioned(
      left: 147,
      top: 737,
      child: Text(
        'Or Login with ',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Argentum Sans',
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildSignUpLink() {
    return const Positioned(
      left: 37,
      top: 861,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'You don’t have an account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Argentum Sans',
                fontWeight: FontWeight.w300,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Color(0xFFFF5370),
                fontSize: 20,
                fontFamily: 'Argentum Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Positioned(
      left: 114,
      top: 797,
      child: Row(
        children: [
          _buildSocialIcon(),
          const SizedBox(width: 30),
          _buildSocialIcon(),
          const SizedBox(width: 30),
          _buildSocialIcon(),
        ],
      ),
    );
  }

  Widget _buildSocialIcon() {
    return Container(
      width: 39.44,
      height: 40,
      padding: const EdgeInsets.only(right: 0.24),
      child: const Center(
        child: Icon(Icons.add), // Substitua pelo ícone desejado
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CustomScreen(),
  ));
}
