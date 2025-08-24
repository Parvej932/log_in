// lib/pages/task_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/task_controller.dart';


// lib/pages/task_page.dart


class TaskPage extends StatelessWidget {
  final TaskController controller = Get.put(TaskController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.fetchTasks();

    return Scaffold(
      appBar: AppBar(title: Text("Task CRUD")),
      body: Obx(() {
        if (controller.taskList.isEmpty) {
          return Center(child: Text("No tasks found"));
        }

        return ListView.builder(
          itemCount: controller.taskList.length,
          itemBuilder: (context, index) {
            final task = controller.taskList[index];
            return ListTile(
              title: Text(task['title'] ?? ""),
              subtitle: Text(task['description'] ?? ""),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      titleController.text = task['title'] ?? "";
                      descController.text = task['description'] ?? "";

                      Get.defaultDialog(
                        title: "Edit Task",
                        content: Column(
                          children: [
                            TextField(controller: titleController, decoration: InputDecoration(labelText: "Title")),
                            TextField(controller: descController, decoration: InputDecoration(labelText: "Description")),
                          ],
                        ),
                        confirm: ElevatedButton(
                          child: Text("Update"),
                          onPressed: () {
                            controller.editTask(task['_id'], titleController.text, descController.text);
                            Get.back();
                          },
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      controller.deleteTask(task['_id']);
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          titleController.clear();
          descController.clear();

          Get.defaultDialog(
            title: "Create Task",
            content: Column(
              children: [
                TextField(controller: titleController, decoration: InputDecoration(labelText: "Title")),
                TextField(controller: descController, decoration: InputDecoration(labelText: "Description")),
              ],
            ),
            confirm: ElevatedButton(
              child: Text("Create"),
              onPressed: () {
                controller.createTask(titleController.text, descController.text);
                Get.back();
              },
            ),
          );
        },
      ),
    );
  }
}
