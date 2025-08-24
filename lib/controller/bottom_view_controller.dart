import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../Page/home_page.dart';
import '../Page/my_task.dart';
import '../Page/profile_page.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> screens = [
     HomePage (),   // My Tasks
    AddTaskPage(), // Add Task
     ProfilePage(), // Profile
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
