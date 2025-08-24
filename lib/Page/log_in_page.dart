import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controller/log_in_controller.dart';
import '../utils/app_colour.dart';
import '../utils/custom_text.dart';
import '../utils/custom_text_field.dart';
import '../utils/custom_button.dart';
import '../utils/primary_text.dart';
import '../utils/secondary_text.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final loginController = Get.put(LoginController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const CustomText(text: "Login", fontSize: 20, fontWeight: FontWeight.bold)),
      body: Obx(() {
        if (loginController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryText(text: 'Welcome Back!', fontSize: 30,),
                      SizedBox(height: 5),
                      SecondaryText(text: "Stay productive and take control of your tasks.", fontSize: 14,),
                      SizedBox(height: 25),
                      PrimaryText(text: 'Email Address',),
                      SizedBox(height: 5),
                      CustomTextField(hintText: 'michelle.rivera@example.com', controller: emailController,),
                      SizedBox(height: 20),
                      PrimaryText(text: 'PassWord',),
                      SizedBox(height: 5),
                      CustomTextField(
                          hintText: "••••••••",
                          suffixIcon: Icons.visibility_off, controller: passwordController,
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          IconButton(onPressed: (){}, icon:Icon(Icons.check_box_outline_blank)),
                          CustomText(text: 'Remember me',fontSize: 12,),

                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(
                            child:
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              height: 2,
                              color: AppColors.lineColor,
                            ),
                          ),
                          Text(
                            "OR",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.orColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Expanded(
                            child:
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 2,
                              color: AppColors.lineColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 35),
                      Row(
                        children: [
                          CustomText(text: "Don’t have an account?"),
                          InkWell(
                            onTap: (){
                              Get.toNamed("/signup");
                            },
                              child: CustomText(text: " Sign Up",fontWeight: FontWeight.w500, color: AppColors.BrandColor,))
                        ],
                      ),
                      SizedBox(height: 25),
                      CustomButton(
                        text: "Login",
                        onPressed: () {
                          if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                            Get.snackbar(
                              "Warning",
                              "All fields are required",
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          } else {
                            loginController.login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 12),

                    ],
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
