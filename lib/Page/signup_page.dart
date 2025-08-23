import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controller/API/signup_controller.dart';

class SignupPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final signupController = Get.put(SignupController());

  SignupPage({super.key}); // ✅ instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Obx(() {
        if (signupController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Enter your name"),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
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
                      /// ✅ Correct way: instance method ব্যবহার
                      signupController.signup(
                        email: emailController.text,
                        password: passwordController.text,
                          name: nameController.text
                      );
                    }
                  },
                  child: Text("Signup"),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}

