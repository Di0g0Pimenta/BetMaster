import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  CustomButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFFF5370),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Color(0xFFD0D0D0),
            fontSize: 24,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
            height: 0,
          ),
        ),
      ),
    );
  }
}
