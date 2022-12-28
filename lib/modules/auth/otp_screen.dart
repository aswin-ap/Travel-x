import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/modules/auth/widgets/otp_widget.dart';
import 'package:flutter_getx_boilerplate/modules/auth/widgets/rounded_auth_button.dart';
import 'package:get/get.dart';

import '../../data/local/preference/constants/colors.dart';
import '../../data/local/preference/constants/common.dart';
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
          body: SafeArea(child: _buildForms(context)),
          bottomSheet: Container(
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              color: Colors.white,
              child: RoundedCornerButton(
                buttonText: 'Verify',
                buttonColor: Colors.green,
                textColor: Colors.white,
                onClick: () {},
              ))),
    );
  }

  Widget _buildForms(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppValues.padding),
      child: Form(
        //  key: controller.registerFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.1),
              Text(
                'Code has been send to +1111*******',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: CommonConstants.smallText,
                  color: ColorConstants.black,
                ),
              ),
              CommonWidget.rowHeight(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OtpInput(controller.otpField1, false),
                  OtpInput(controller.otpField2, false),
                  OtpInput(controller.otpField3, false),
                  OtpInput(controller.otpField4, false)
                ],
              ),
              CommonWidget.rowHeight(height: 60),
              Text.rich(
                TextSpan(
                    text: 'Resend code in ',
                    style: TextStyle(
                      fontSize: CommonConstants.smallText,
                      color: ColorConstants.black,
                    ),
                    children: [
                      TextSpan(
                          text: '55',
                          style: TextStyle(
                            fontSize: CommonConstants.smallText,
                            color: Colors.green,
                          )),
                      TextSpan(
                          text: ' s',
                          style: TextStyle(
                            fontSize: CommonConstants.smallText,
                            color: ColorConstants.black,
                          ))
                    ]),
              ),
              CommonWidget.rowHeight(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
