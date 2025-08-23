import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

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
          ],
        ),
      ),
    );
  }
}

