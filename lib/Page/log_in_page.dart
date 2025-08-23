import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controller/log_in_controller.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginController = Get.put(LoginController()); // ✅ instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Obx(() {
        if (loginController.isLoading.value) {
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
                      loginController.login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    }
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}

