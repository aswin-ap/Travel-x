import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/local/preference/constants/storage.dart';
import '../../data/models/request/login_request.dart';
import '../../data/models/request/register_request.dart';
import '../../network/api_repository.dart';
import '../../utils/common_widget.dart';
import '../../utils/focus.dart';

class AuthController extends GetxController {
  final ApiRepository apiRepository;
  AuthController({required this.apiRepository});

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();
  bool registerTermsChecked = false;

  final isFullNameFocused = false.obs;
  final isEmailFocused = false.obs;
  final isPasswordFocused = false.obs;
  final isConfirmPasswordFocused = false.obs;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void register(BuildContext context) async {
    AppFocus.unfocus(context);
    if (registerFormKey.currentState!.validate()) {
      if (!registerTermsChecked) {
        CommonWidget.toast('Please check the terms first.');
        return;
      }

      final res = await apiRepository.register(
        RegisterRequest(
          email: registerEmailController.text,
          password: registerPasswordController.text,
        ),
      );

      final prefs = Get.find<SharedPreferences>();
      if (res!.token.isNotEmpty) {
        prefs.setString(StorageConstants.token, res.token);
        print('Go to Home screen>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
      }
    }
  }

  void login(BuildContext context) async {
    AppFocus.unfocus(context);
    if (loginFormKey.currentState!.validate()) {
      final res = await apiRepository.login(
        LoginRequest(
          email: loginEmailController.text,
          password: loginPasswordController.text,
        ),
      );

      final prefs = Get.find<SharedPreferences>();
      if (res!.token.isNotEmpty) {
        prefs.setString(StorageConstants.token, res.token);
        Get.toNamed(Routes.HOME);
      }
    }
  }

  @override
  void onClose() {
    super.onClose();

    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();

    loginEmailController.dispose();
    loginPasswordController.dispose();
  }
}