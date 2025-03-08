import 'package:flutter/material.dart';
import 'package:news_app/constants/logo_widget.dart';
import 'package:news_app/features/auth/widgets/auth_screen_body.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                LogoWidget(),
                SizedBox(height: 10),
                AuthScreenBody()
              ],
            ),
          ),
        ),
      )),
    );
  }
}
