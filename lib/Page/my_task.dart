import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:log_in/utils/Custom_button.dart';
import 'package:log_in/utils/custom_text_field.dart';

import '../controller/task_controller.dart';
import '../utils/primary_text.dart';


class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find<TaskController>();

    final titleController = TextEditingController();
    final descController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Add Task"),
      centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PrimaryText(text: 'Task Title',),
            SizedBox(height: 5),
            CustomTextField(controller: titleController, hintText: "e.g. Design Landing Page Header"),
            PrimaryText(text: 'Description',),
            SizedBox(height: 5),
            CustomTextField(controller: descController, hintText: "e.g. Include logo, navigation, and CTA button with brand color", ),
             SizedBox(height: 15,),
            CustomButton(text: "Save Task", onPressed: (){
              if (titleController.text.isNotEmpty &&
                  descController.text.isNotEmpty) {
                taskController.createTask(
                    titleController.text, descController.text);

                Get.back(); // হোম পেজে ফেরত যাবে
              } else {
                Get.defaultDialog( title: "Warning",
                  middleText: "Are you sure you want to Add this task?",
                  textCancel: "Cancel",
                  textConfirm: "Confirm",
                  onCancel: (){
                    Get.back();
                  },
                  onConfirm: (){
                    Get.defaultDialog(
                      title: "Success",
                      middleText: "Your task has been added successfully.",
                      textConfirm: "OK",
                      onConfirm: (){
                        Get.offNamed("/task");
                      },
                    );
                  },

                );
              }
            }),

          ],
        ),
      ),
    );
  }
}

