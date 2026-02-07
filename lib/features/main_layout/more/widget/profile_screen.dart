import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/widget/custom_elevated_button.dart';
import 'package:fruits/core/resources/widget/custom_form_field.dart';
import 'package:fruits/core/resources/widget/custom_phone_field.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
              children: [
              SizedBox(height: 25),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 33,
                color: AppColors.black,
              ),
            ),
          ),
        SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:Colors.transparent,
                      border: Border.all(
                        color: Color(0xff959CA8),
                        width: 2
                      )
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppAssets.profileIcon,
                        height: 60,
                        color: Color(0xff959CA8),
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppAssets.addPhotoIcon,
                        height: 30,
                        color: AppColors.green,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "Welcome, Ahmed",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Full name ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF858D9A),
                    ),
                  ),
                ],
              ),
              CustomFormField(
                hintText: "First and Last Name",
                isPassword: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
                controller: TextEditingController(),
              ),
              SizedBox(height: 10),
              CustomPhoneField(),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF858D9A),
                    ),
                  ),
                ],
              ),
              CustomFormField(
                hintText: "Enter your password",
                isPassword: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
                controller: TextEditingController(),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: "Update",
                onTap: () {},
                color: AppColors.green,
                textColor: AppColors.white,
              ),

            ],
          ),
        ),
        ]),
        ),
      ),
    );
  }
}

