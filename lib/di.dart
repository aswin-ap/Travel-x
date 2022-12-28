import 'package:get/get.dart';

import 'data/local/preference/services/preference_service.dart';


class DenpendencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() =>
        PreferenceService().init());
  }
}
