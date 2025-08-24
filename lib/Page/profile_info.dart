import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:log_in/utils/info_card.dart';


import '../controller/API/profile_info_controller.dart';


class  ProfileInfo extends StatelessWidget {
  final ProfileInfoController  controller = Get.put(ProfileInfoController ());

  @override
  Widget build(BuildContext context) {
    controller.fetchProfile();

    return Scaffold(
      appBar: AppBar(title: Text("My Profile")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.profileData.isEmpty) {
          return Center(child: Text("No profile data found"));
        }

        final profile = controller.profileData;

        return

          Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column (
            children: [
              InfoCard(
                icon: Icons.person,
                value: Text("Name: ${profile['name'] ?? ''}", style: TextStyle(fontSize: 18)),
              ),
              InfoCard(
                icon: Icons.email,
                value: Text("Name: ${profile['email'] ?? ''}", style: TextStyle(fontSize: 18))
              ),
              InfoCard(
                icon: Icons.location_on,
                value: Text("Status: ${profile['status'] ?? ''}", style: TextStyle(fontSize: 18))
              ),
              // Add more InfoCards if needed
            ],
          ),
              /*
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blueGrey,
                child: Text(
                  (profile['name'] ?? "U")[0].toUpperCase(),
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              InfoCard(icon: Icons.email,
              value: Text("Name: ${profile['name'] ?? ''}", style: TextStyle(fontSize: 18))),
              Text("Email: ${profile['email'] ?? ''}", style: TextStyle(fontSize: 18)),
              Text("Phone: ${profile['phoneNumber'] ?? 'Not set'}", style: TextStyle(fontSize: 18)),
              Text("Role: ${profile['role'] ?? ''}", style: TextStyle(fontSize: 18)),
              Text("Status: ${profile['status'] ?? ''}", style: TextStyle(fontSize: 18)),
              Text("Verified: ${profile['verification']?['status'] == true ? 'Yes' : 'No'}", style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text("Created At: ${profile['createdAt']}", style: TextStyle(fontSize: 16, color: Colors.grey)),
            ],
          ),*/




        );
      }),
    );
  }
}
