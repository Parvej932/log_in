
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../api_service.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;
  final storage = GetStorage(); // ✅ GetStorage instance

  Future<void> signup({required String email,required String name,  required String password}) async {
    try {
      isLoading(true);

      var map = {"email": email,"name": name, "password": password};

      var response = await http.post(
        Uri.parse(ApiService.signup),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(map),
      );

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        if (responseBody['success'] == true) {
          // ✅ Save token using GetStorage
         // storage.write('accessToken', responseBody['data']['accessToken']);

          // ✅ Show success snackbar
          Get.snackbar(
            "Sign Up Success",
            responseBody['message'] ?? "Welcome back!",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );

          // ✅ Navigate to HomePage
          Get.toNamed("/login");
        } else {
          Get.snackbar(
            "Signup Failed",
            responseBody['message'] ?? "Invalid credentials",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } else {
        Get.snackbar(
          "Error",
          "Something went wrong",
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
