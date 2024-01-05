import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:betmaster/widgets/inputbox.dart';
import 'package:betmaster/widgets/button.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildText("Name"),
            const SizedBox(height: 17),
            CustomInputBox(
                hintText: "Enter your Name", controller: usernameController),
            const SizedBox(height: 30),
            _buildText("Email"),
            const SizedBox(height: 17),
            CustomInputBox(
                hintText: "Enter your email", controller: usernameController),
            const SizedBox(height: 30),
            _buildText("Password"),
            const SizedBox(height: 17),
            CustomInputBox(
                hintText: "Enter your password",
                controller: passwordController),
            const SizedBox(height: 8),
            const SizedBox(height: 20),
            CustomButton(text: 'Register', onPressed: () {}),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "You have an account? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: "Sign IN",
                    style: const TextStyle(
                      color: Color(0xFFFF5370),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w900,
                      height: 0,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pop(
                          context,
                        );
                        print('Sign Up link clicked!');
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w400,
        color: Color(0xFFD0D0D0),
      ),
    );
  }
}
