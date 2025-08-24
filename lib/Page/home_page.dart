import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:log_in/utils/custom_button.dart';

class HomePage extends StatelessWidget {
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    String? token = storage.read('accessToken');

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child:
        Column(
          children: [
            Text("Hi I am Parvej"),
            Text("Access Token: $token"),
            CustomButton(text: "Task", onPressed: (){
              Get.toNamed("/task");
            }),
            CustomButton(text: "Task", onPressed: (){
              Get.toNamed("/profile");
            })



          ],
        ),
      ),
    );
  }
}

