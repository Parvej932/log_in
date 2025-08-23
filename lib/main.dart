import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:log_in/Page/signup_page.dart';

import 'Page/home_page.dart';
import 'Page/log_in_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init(); // ✅ Storage initialize

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/signup",
      getPages: [
        GetPage(name: "/signup", page: () => SignupPage()),
        GetPage(name: "/login", page: () => LoginPage()),
        GetPage(name: "/home", page: () => HomePage()),
      ],
    );
  }
}
