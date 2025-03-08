import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/features/auth/controller/auth_controller.dart';
import 'package:news_app/features/auth/widgets/custom_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(
              Icons.alternate_email_outlined,
            ),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(
              Icons.password,
            ),
          ),
        ),
        SizedBox(height: 30),
        Obx(
          () => authController.isLoading2.value
              ? CircularProgressIndicator()
              : InkWell(
                  onTap: () {
                    authController.signInWithGoogle();
                  },
                  child: Container(
                    width: 280,
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/logos/google.png', width: 20),
                        SizedBox(width: 10),
                        Text(
                          "Sign Up With Google",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
        SizedBox(height: 10),
        Obx(
          () => authController.isLoading1.value
              ? CircularProgressIndicator()
              : SizedBox(
                  width: 280,
                  child: Center(
                    child: CustomButton(
                      text: 'SIGNUP',
                      icon: Icons.lock_open_rounded,
                      onTap: () {
                        authController.signUp(
                            emailController.text, passwordController.text);
                        // Get.offAllNamed('/home-screen');
                      },
                    ),
                  ),
                ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
