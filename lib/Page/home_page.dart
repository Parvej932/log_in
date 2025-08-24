import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                title: Text(
                  task['title'] ?? "No Title",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(task['description'] ?? "No Description"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.green),
                      onPressed: () {
                        // 🟢 Edit Task page এ নিয়ে যাবে
                        // তুমি চাইলে Get.to(EditTaskPage(task: task));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        taskController.deleteTask(task['_id']);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
