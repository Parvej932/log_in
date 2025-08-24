import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bottom_view_controller.dart';
import '../utils/app_colour.dart';


class BottomView extends StatelessWidget {
  const BottomView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavController());

    return Obx(() => Scaffold(
      body: controller.screens[controller.selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        selectedItemColor: AppColors.BrandColor,
        unselectedItemColor: Colors.black,
        onTap: controller.changeIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'My Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: 'Add Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    ));
  }
}
