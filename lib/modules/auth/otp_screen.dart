import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/common_widget.dart';
import '../../utils/values/app_colors.dart';
import '../../utils/values/app_values.dart';
import 'auth_controller.dart';

class OtpScreen extends StatelessWidget {
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
            "OTP Code Verification",
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
            children: [],
          ),
        ),
      ),
    );
  }
}
