import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/modules/profile/profile_controller.dart';
import 'package:flutter_getx_boilerplate/modules/profile/widgets/gender_dropdown_button.dart';
import 'package:flutter_getx_boilerplate/modules/profile/widgets/profile_input_field.dart';
import 'package:get/get.dart';

import '../../utils/common_widget.dart';
import '../../utils/size_config.dart';
import '../../utils/values/app_colors.dart';
import '../../utils/values/app_values.dart';
import '../auth/widgets/rounded_auth_button.dart';

class ProfileScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorWhite,
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          appBar: CommonWidget.appBar(
            context,
            "Fill Your Profile",
            Icons.arrow_back,
            Colors.black,
          ),
          body: SafeArea(child: _buildForms(context))),
    );
  }

  Widget _buildForms(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppValues.padding),
      child: Form(
        key: controller.profileFormKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundImage: NetworkImage(
                          'https://live.staticflickr.com/5252/5403292396_0804de9bcf_b.jpg'),
                    ),
                    Positioned.fill(
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.green,
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 24.0,
                              ),
                            )))
                  ],
                ),
              ),
              CommonWidget.rowHeight(height: 25),
              ProfileInputField(
                controller: controller.nameController,
                keyboardType: TextInputType.name,
                hint: 'Full Name',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Full name is required.';
                  }
                  return null;
                },
              ),
              CommonWidget.rowHeight(height: 20),
              ProfileInputField(
                controller: controller.nameController,
                keyboardType: TextInputType.name,
                hint: 'Nickname',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Full name is required.';
                  }
                  return null;
                },
              ),
              CommonWidget.rowHeight(height: 20),
              ProfileInputField(
                controller: controller.nameController,
                keyboardType: TextInputType.number,
                iconData: Icons.calendar_month,
                hint: 'Date of Birth',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Full name is required.';
                  }
                  return null;
                },
              ),
              CommonWidget.rowHeight(height: 20),
              ProfileInputField(
                controller: controller.nameController,
                keyboardType: TextInputType.emailAddress,
                iconData: Icons.email_outlined,
                hint: 'Email',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Full name is required.';
                  }
                  return null;
                },
              ),
              CommonWidget.rowHeight(height: 20),
              ProfileInputField(
                controller: controller.nameController,
                keyboardType: TextInputType.phone,
                iconData: Icons.local_phone_outlined,
                hint: 'Phone',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Full name is required.';
                  }
                  return null;
                },
              ),
              CommonWidget.rowHeight(height: 20),
              Obx(() {
                return GenderDropDownButton(
                  items: controller.genderList,
                  height: SizeConfig().screenHeight * 0.07,
                  selectedItem: (item) {
                    controller.setGender(item);
                  },
                  currentValue: controller.selectedGender!,
                );
              }),
              CommonWidget.rowHeight(height: 30),
              RoundedCornerButton(
                buttonText: 'Continue',
                buttonColor: Colors.green,
                textColor: Colors.white,
                onClick: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
