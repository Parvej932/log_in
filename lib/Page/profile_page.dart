import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/API/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Obx(() {
        final user = profileController.user.value;

        return SingleChildScrollView(
          child: Column(
            children: [
              // 🔹 Top Green Header
              Container(
                height: 180,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/profile_bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: user.profile != null &&
                          user.profile!.isNotEmpty
                          ? NetworkImage(user.profile!)
                          : const AssetImage("assets/images/avatar.png")
                      as ImageProvider,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user.name,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      user.email,
                      style:
                      const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 My Profile / Account Setting
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _buildProfileOption(
                      icon: Icons.person,
                      title: "My Profile",
                      onTap: () => Get.toNamed("/ProfileInfoe"),
                    ),
                    _buildProfileOption(
                      icon: Icons.settings,
                      title: "Account Setting",
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 More Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text("More",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    _buildProfileOption(
                        icon: Icons.article_outlined,
                        title: "Terms & Condition",
                        onTap: () {}),
                    _buildProfileOption(
                        icon: Icons.privacy_tip_outlined,
                        title: "Privacy Policy",
                        onTap: () {}),
                    _buildProfileOption(
                        icon: Icons.help_outline,
                        title: "Help / Support",
                        onTap: () {}),
                    _buildProfileOption(
                        icon: Icons.logout,
                        title: "Log Out",
                        color: Colors.red,
                        onTap: () {
                          // TODO: Add logout logic
                        }),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = Colors.green,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
