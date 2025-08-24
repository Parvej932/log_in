import 'package:get/get.dart';

import '../../utils/user_model.dart';


class ProfileController extends GetxController {
  var user = UserModel(
    name: "safin",
    email: "safinislam0804@gmail.com",
    address: "No Address Provided", // API did not provide
    profile: null,
  ).obs;

  // Simulate API fetch
  void fetchProfile() async {
    await Future.delayed(Duration(seconds: 1)); // simulate loading
    // Normally you'd fetch from API here
    user.value = UserModel.fromJson({
      "name": "safin",
      "email": "safinislam0804@gmail.com",
      "address": "No Address Provided",
      "profile": null
    });
  }

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }
}
