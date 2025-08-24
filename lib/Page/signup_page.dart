import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/API/signup_controller.dart';
import '../controller/text_field_controler.dart';
import '../utils/app_colour.dart';
import '../utils/custom_text.dart';
import '../utils/custom_text_field.dart';
import '../utils/custom_button.dart';
import '../utils/primary_text.dart';
import '../utils/secondary_text.dart';

class SignupPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final  confirmPasswordController = TextEditingController();
  final signupController = Get.put(SignupController());
  final AuthController controller = Get.put(AuthController());

  SignupPage({super.key}); // ✅ instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (signupController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(text: 'Create Your Account', fontSize: 30,),
                  SizedBox(height: 5),
                  SecondaryText(text: "Join Task Manager today — organize better, work smarter, and stay in control of your day.", textAlign: TextAlign.start, fontSize: 14,),
                  SizedBox(height: 25),
                  PrimaryText(text: 'First Name',),
                  SizedBox(height: 5),
                  CustomTextField(hintText: 'e.g. Kristin ', controller: firstNameController,),
                  SizedBox(height: 20),
                  PrimaryText(text: 'Last Name',),
                  SizedBox(height: 5),
                  CustomTextField(hintText: 'e.g. Cooper', controller: lastNameController,),
                  SizedBox(height: 20),
                  PrimaryText(text: 'Email Address',),
                  SizedBox(height: 5),
                  CustomTextField(hintText: 'e.g. kristin.cooper@example.com', controller: emailController,),
                  SizedBox(height: 20),
                  PrimaryText(text: 'Address',),
                  SizedBox(height: 5),
                  CustomTextField(hintText: 'e.g. 1234 Elm Street, Springfield, IL', controller: addressController,),
                  SizedBox(height: 20),
                  PrimaryText(text: 'PassWord',),
                  SizedBox(height: 5),
                  CustomTextField(
                      hintText: "••••••••",
                      suffixIcon: Icons.visibility_off, controller: passwordController,
                  ),
                  SizedBox(height: 20),
                  PrimaryText(text: ' Confirm password',),
                  SizedBox(height: 5),
                  CustomTextField(
                      hintText: "••••••••",
                      suffixIcon: Icons.visibility_off, controller: confirmPasswordController,
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon:Icon(Icons.check_box_outline_blank)),
                      CustomText(text: 'I agree to the Terms & Conditions and Privacy Policy.',fontSize: 11,),
              
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
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
                        child: Container(
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
                      CustomText(text: "Already have an account?"),
                      InkWell(
                          child: CustomText(text: " Log In",fontWeight: FontWeight.w500, color: AppColors.BrandColor,))
                    ],
                  ),
                  SizedBox(height: 25),
                  CustomButton(
                    text: "Signup",
                    onPressed: ()
                    {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        Get.snackbar(
                          "Warning",
                          "All fields are required",
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      } else {
                        signupController.signup(
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text,
                        );
                      }
                    },
                  ),
              
              
                  /* CustomTextField(
                    controller: emailController,
                    hintText: 'Enter your email',
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
              
                  CustomButton(
                    text: "Signup",
                    onPressed: ()
                     {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        Get.snackbar(
                          "Warning",
                          "All fields are required",
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      } else {
                        signupController.signup(
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text,
                        );
                      }
                    },
                  ),*/
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
