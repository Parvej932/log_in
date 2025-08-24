// lib/controllers/task_controller.dart
import 'package:get/get.dart';

import 'API/base_client.dart';
import 'api_service.dart';


// lib/controllers/task_controller.dart


class TaskController extends GetxController {
  var taskList = <Map<String, dynamic>>[].obs;

  // Fetch all tasks
  void fetchTasks() async {
    try {
      var response = await BaseClient.getRequest(api: ApiService.readtask);
      var data = await BaseClient.handleResponse(response);

      // Server response structure check
      if (data['data'] != null && data['data'] is List) {
        taskList.value = List<Map<String, dynamic>>.from(data['data']);
      } else {
        taskList.clear();
      }

    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

  // Create single task
  void createTask(String title, String description) async {
    try {
      var body = {"title": title, "description": description};
      var response = await BaseClient.postRequest(api: ApiService.creattask, body: body);
      var data = await BaseClient.handleResponse(response);

      // Add single task to existing list
      if (data['data'] != null && data['data'] is Map) {
        taskList.add(Map<String, dynamic>.from(data['data']));
        Get.snackbar("Success", data['message'] ?? "Task created");
      }

    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

  // Edit / Update task
  void editTask(String id, String title, String description) async {
    try {
      var body = {"title": title, "description": description};
      var response = await BaseClient.patchRequest(api: "https://example.com/tasks/$id", body: body);
      var data = await BaseClient.handleResponse(response);

      if (data['data'] != null && data['data'] is Map) {
        // Update task in taskList
        int index = taskList.indexWhere((t) => t['_id'] == id);
        if (index != -1) taskList[index] = Map<String, dynamic>.from(data['data']);
        Get.snackbar("Success", data['message'] ?? "Task updated");
      }

    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

  // Delete task
  void deleteTask(String id) async {
    try {
      var response = await BaseClient.deleteRequest(api: "https://example.com/tasks/$id");
      var data = await BaseClient.handleResponse(response);

      // Remove task from list
      taskList.removeWhere((t) => t['_id'] == id);
      Get.snackbar("Success", data['message'] ?? "Task deleted");

    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }
}
