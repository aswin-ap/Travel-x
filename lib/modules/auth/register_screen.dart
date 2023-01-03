import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/modules/auth/auth.dart';
import 'package:flutter_getx_boilerplate/modules/auth/widgets/auth_input_field.dart';
import 'package:flutter_getx_boilerplate/modules/auth/widgets/rounded_auth_button.dart';
import 'package:flutter_getx_boilerplate/modules/auth/widgets/social_button.dart';
import 'package:flutter_getx_boilerplate/utils/values/app_colors.dart';
import 'package:flutter_getx_boilerplate/utils/values/app_values.dart';
import 'package:get/get.dart';

import '../../data/local/preference/constants/colors.dart';
import '../../data/local/preference/constants/common.dart';
import '../../routes/app_pages.dart';
import '../../utils/common_widget.dart';
import '../../utils/regex.dart';
import '../../utils/values/text_styles.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController controller = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorWhite,
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          appBar: CommonWidget.appBar(
            context,
            "",
            Icons.arrow_back,
            Colors.black,
          ),
          body: SafeArea(child: Obx(() {
            return _buildForms(context);
          }))),
    );
  }

  Widget _buildForms(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppValues.padding),
      child: Form(
        key: controller.registerFormKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/app_main.png',
                  width: Get.width / 5,
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              Text(
                'Create New Account',
                textAlign: TextAlign.center,
                style: mediumTitleStyle.copyWith(
                  color: AppColors.textColorPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: Get.height * 0.04),
              AuthInputField(
                controller: controller.registerEmailController,
                isFocused: controller.isFullNameFocused.value,
                iconData: Icons.person,
                iconSize: 24,
                focusCallBack: (focusValue) {
                  print('Focus at fullname $focusValue');
                  controller.isFullNameFocused.value = focusValue!;
                },
                keyboardType: TextInputType.name,
                hint: 'Full Name',
                validator: (value) {
                  if (!Regex.isEmail(value!)) {
                    return 'Email format error.';
                  }

                  if (value.isEmpty) {
                    return 'Email is required.';
                  }
                  return null;
                },
              ),
              CommonWidget.rowHeight(height: 20),
              AuthInputField(
                controller: controller.registerEmailController,
                iconData: Icons.email_rounded,
                keyboardType: TextInputType.emailAddress,
                hint: 'Email',
                isFocused: controller.isEmailFocused.value,
                focusCallBack: (focusValue) {
                  controller.isEmailFocused.value = focusValue!;
                },
                validator: (value) {
                  if (!Regex.isEmail(value!)) {
                    return 'Email format error.';
                  }

                  if (value.isEmpty) {
                    return 'Email is required.';
                  }
                  return null;
                },
              ),
              CommonWidget.rowHeight(height: 20),
              AuthInputField(
                controller: controller.registerEmailController,
                iconData: Icons.lock,
                keyboardType: TextInputType.visiblePassword,
                password: true,
                hint: 'Password',
                isFocused: controller.isPasswordFocused.value,
                focusCallBack: (focusValue) {
                  controller.isPasswordFocused.value = focusValue!;
                },
                validator: (value) {
                  if (!Regex.isEmail(value!)) {
                    return 'Email format error.';
                  }

                  if (value.isEmpty) {
                    return 'Email is required.';
                  }
                  return null;
                },
              ),
              CommonWidget.rowHeight(height: 20),
              AuthInputField(
                controller: controller.registerEmailController,
                iconData: Icons.lock,
                password: true,
                keyboardType: TextInputType.visiblePassword,
                hint: 'Confirm Password',
                isFocused: controller.isConfirmPasswordFocused.value,
                focusCallBack: (focusValue) {
                  controller.isConfirmPasswordFocused.value = focusValue!;
                },
                validator: (value) {
                  if (!Regex.isEmail(value!)) {
                    return 'Email format error.';
                  }

                  if (value.isEmpty) {
                    return 'Email is required.';
                  }
                  return null;
                },
              ),
              CommonWidget.rowHeight(height: 30),
              RoundedCornerButton(
                buttonText: 'Sign Up',
                buttonColor: Colors.green,
                textColor: Colors.white,
                onClick: () {
                  //  controller.register(context);
                 // Get.toNamed(Routes.OTP, arguments: controller);
                  Get.toNamed(Routes.PROFILE);
                },
              ),
              CommonWidget.rowHeight(height: 15),
              Text(
                'or continue with',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: CommonConstants.smallText,
                  color: ColorConstants.black,
                ),
              ),
              CommonWidget.rowHeight(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(image: 'assets/images/google_logo.png'),
                  CommonWidget.rowWidth(),
                  SocialButton(image: 'assets/images/apple_logo.png')
                ],
              ),
              CommonWidget.rowHeight(height: 20),
              Center(
                child: Text.rich(
                  TextSpan(
                      text: 'Don\'t have an account?  ',
                      style: primaryColorSubtitleStyle.copyWith(
                          color: AppColors.textColorGreyLight),
                      children: [
                        TextSpan(
                            text: 'Sign in',
                            style: primaryColorSubtitleStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Colors.green))
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
