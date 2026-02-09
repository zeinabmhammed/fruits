import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/resources/app_colors/app_colors.dart';
import 'package:fruits/core/resources/app_assets/app_assets.dart';
import 'package:fruits/core/resources/responsive/responsive.dart';
import 'package:fruits/core/resources/widget/custom_elevated_button.dart';
import 'package:fruits/core/resources/widget/custom_form_field.dart';
import 'package:fruits/core/resources/widget/custom_phone_field.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.scaleWidth(30)),
          child: Column(
            children: [
              SizedBox(height: responsive.scaleHeight(25)),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: responsive.scaleWidth(33),
                    color: AppColors.black,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(responsive.scaleWidth(16)),
                  child: Column(
                    children: [
                      SizedBox(height: responsive.scaleHeight(20)),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            width: responsive.scaleWidth(120),
                            height: responsive.scaleWidth(120),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border: Border.all(
                                color: const Color(0xff959CA8),
                                width: responsive.scaleWidth(2),
                              ),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                AppAssets.profileIcon,
                                height: responsive.scaleHeight(60),
                                color: const Color(0xff959CA8),
                              ),
                            ),
                          ),
                          Container(
                            width: responsive.scaleWidth(40),
                            height: responsive.scaleWidth(40),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                AppAssets.addPhotoIcon,
                                height: responsive.scaleHeight(30),
                                color: AppColors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: responsive.scaleHeight(20)),
                      Text(
                        "Welcome, Ahmed",
                        style: TextStyle(
                          fontSize: responsive.scaleWidth(24),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: responsive.scaleHeight(20)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Full name ",
                          style: TextStyle(
                            fontSize: responsive.scaleWidth(14),
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF858D9A),
                          ),
                        ),
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
                        controller: nameController,
                      ),
                      SizedBox(height: responsive.scaleHeight(10)),
                      const CustomPhoneField(),
                      SizedBox(height: responsive.scaleHeight(15)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(
                            fontSize: responsive.scaleWidth(14),
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF858D9A),
                          ),
                        ),
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
                        controller: passwordController,
                      ),
                      SizedBox(height: responsive.scaleHeight(20)),
                      CustomButton(
                        text: "Update",
                        onTap: () {},
                        color: AppColors.green,
                        textColor: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
