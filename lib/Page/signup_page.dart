import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/API/signup_controller.dart';
import '../controller/text_field_controler.dart';
import '../utils/custom_text.dart';
import '../utils/custom_text_field.dart';
import '../utils/custom_button.dart';

class SignupPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final signupController = Get.put(SignupController());
  final AuthController controller = Get.put(AuthController());

  SignupPage({super.key}); // ✅ instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText(text: "Sign Up", fontSize: 20, fontWeight: FontWeight.bold)),
      body: Obx(() {
        if (signupController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomTextField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                CustomTextField(
                  controller: nameController,
                  hintText: 'Enter your name',
                  prefixIcon: Icons.person,
                ),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: "Signup",
                  onPressed: () {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      Get.snackbar(
                        "Warning",
                        "All fields are required",
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    } else {
                      signupController.signup(
                        email: emailController.text,
                        password: passwordController.text,
                        name: nameController.text,
                      );
                    }
                  },
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
