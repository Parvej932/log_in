// lib/controllers/profile_controller.dart
import 'package:get/get.dart';
import 'package:log_in/controller/api_service.dart';
import 'package:log_in/utils/app_colour.dart';

import 'base_client.dart';


class ProfileController extends GetxController {
  var profileData = {}.obs;
  var isLoading = false.obs;

  void fetchProfile() async {
    try {
      isLoading(true);
      var response = await BaseClient.getRequest(api: ApiService.profile);
      var data = await BaseClient.handleResponse(response);

      if (data['success'] == true && data['data'] != null) {
        profileData.value = Map<String, dynamic>.from(data['data']);
      } else {
        profileData.clear();
      }
    } catch (e) {
      Get.snackbar("Error", "$e");
    } finally {
      isLoading(false);
    }
  }
}
