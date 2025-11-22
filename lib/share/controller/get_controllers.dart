import 'package:get/get.dart';
import 'language_controller.dart';


class GetControllers {
  static final GetControllers _singleton = GetControllers._internal();

  GetControllers._internal();

  static GetControllers get instance => _singleton;


  LanguageController getLanguageController() {
    if (!Get.isRegistered<LanguageController>()) {
      Get.put(LanguageController(),permanent: true);
    }
    return Get.find<LanguageController>();
  }

/*  ChangeCurrencyController getChangeCurrencyController() {
    if (!Get.isRegistered<ChangeCurrencyController>()) {
      Get.put(ChangeCurrencyController(),permanent: true);
    }
    return Get.find<ChangeCurrencyController>();
  }

  LocationSendController getLocationSendController() {
    if (!Get.isRegistered<LocationSendController>()) {
      Get.put(LocationSendController(),permanent: true);
    }
    return Get.find<LocationSendController>();
  }*/
}
