import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/logos/Icon_For_News_App.png',
          width: 130,
        ),
        SizedBox(height: 10),
        Text(
          'NewsWave',
          style: TextStyle(
            fontSize: 28,
            fontFamily: 'Poppins',
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
