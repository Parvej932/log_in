
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../api_service.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;
  final storage = GetStorage(); // ✅ GetStorage instance

  Future<void> signup({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      isLoading(true);

      var map = {"email": email, "name": name, "password": password};

      var response = await http.post(
        Uri.parse(ApiService.signup),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(map),
      );

      var responseBody = jsonDecode(response.body); // ✅ একবারই decode

      if (response.statusCode == 200) {
        if (responseBody['success'] == true) {
          // ✅ Signup success হলে snackbar দেখাবে
          Get.snackbar(
            "Sign Up Success",
            responseBody['message'] ?? "Welcome!",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );

          // ✅ Login এ redirect
          Get.offNamed("/login");
        }
        else if (responseBody['message'] == "User already exists with this email") {
          // ✅ যদি user আগে থেকেই থাকে
          Get.snackbar(
            "Account Exists",
            responseBody['message'],
            backgroundColor: Colors.orange,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
          Get.offNamed("/login");
        }
        else {
          // ✅ অন্য error হলে
          Get.snackbar(
            "Signup Failed",
            responseBody['message'] ?? "Invalid credentials",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
      // 🔹 এখানে নতুন condition add করা হলো
      else if (response.statusCode == 403 &&
          responseBody['message'] == "User already exists with this email") {
        Get.snackbar(
          "Account Exists",
          responseBody['message'],
          backgroundColor: Colors.orange,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.toNamed("/login");
      }
      else {
        Get.snackbar(
          "Error",
          "Something went wrong: ${response.statusCode}",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Exception",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }
}
