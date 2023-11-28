import 'package:flutter/material.dart';

class CustomInputBox extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  CustomInputBox({required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(
                color: Color(0xFFD0D0D0),
                fontSize: 24,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w100,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFFD0D0D0),
                  fontSize: 24,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w100,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
