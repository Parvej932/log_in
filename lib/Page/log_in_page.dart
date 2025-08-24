import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controller/log_in_controller.dart';
import '../utils/custom_text.dart';
import '../utils/custom_text_field.dart';
import '../utils/custom_button.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final loginController = Get.put(LoginController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const CustomText(text: "Login", fontSize: 20, fontWeight: FontWeight.bold)),
      body: Obx(() {
        if (loginController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: emailController,
                  hintText: "Enter Email",
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: passwordController,
                  hintText: "Enter Password",
                  prefixIcon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: "Login",
                  onPressed: () {
                    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                      Get.snackbar(
                        "Warning",
                        "All fields are required",
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    } else {
                      loginController.login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    }
                  },
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    Get.toNamed("/signup");
                  },
                  child: const CustomText(
                    text: "Don't have an account? Sign up",
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
