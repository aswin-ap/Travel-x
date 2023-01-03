import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../network/api_repository.dart';

class ProfileController extends GetxController {
  final ApiRepository apiRepository;
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final genderList = ['Male', 'Female', 'Prefer not to say'];

  ProfileController({required this.apiRepository});

  ///selected gender
  var _selectedGender = RxnString("null");
  String? get selectedGender => _selectedGender.value;
  void setGender(String value) {
    _selectedGender.value = value;
  }

  @override
  void onInit() async {
    super.onInit();
  }
}
