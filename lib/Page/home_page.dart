import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:log_in/utils/primary_text.dart';
import 'package:log_in/utils/secondary_text.dart';

import '../controller/task_controller.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.put(TaskController());

    // API থেকে ডেটা আনবো যখন পেজ লোড হবে
    taskController.fetchTasks();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Tasks"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (taskController.taskList.isEmpty) {
          return const Center(child: Text("No tasks found. Add a new one!"));
        }

        return ListView.builder(
          itemCount: taskController.taskList.length,
          itemBuilder: (context, index) {
            final task = taskController.taskList[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child:Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/s1.png"), fit: BoxFit.cover)
                  ),
                ),
              ListTile(
                title: PrimaryText(
                    text: "${task['title'] ?? ''} ",
                ),
                subtitle:  SecondaryText(
            text: " Name: ${task['description'] ?? ''} ",
            ),


              ),]),
            );
          },
        );
      }),
    );
  }
}
