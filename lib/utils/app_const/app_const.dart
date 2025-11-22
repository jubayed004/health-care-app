import 'package:get/get.dart';

import '../../share/model/language_model.dart';

class AppConstants {
  // static const baseURL = "http://143.198.238.107:5050"; //Live
  // static const baseURL = "http://10.0.60.118:5051"; //Local

  //Language
  static const String languageCode = "languagesCode";
  static const String countryCode = "countryCode";
  static const String selectedValue = "selectedValue";
  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: "", languageName: 'spanish'.tr, countryCode: 'ES', languageCode: 'es'),
    LanguageModel(imageUrl: "", languageName: 'english'.tr, countryCode: 'US', languageCode: 'en'),
  ];


  static String getLastSixDigits(String? input) {
    if (input == null || input.isEmpty) {
      return '';
    }
    return input.length > 8 ? input.substring(input.length - 8) : input;
  }

  static const String oneSignalAPI = "16206e02-dd33-4ad5-88c8-ba4d20279af0";
  //Google Map API Key

  static const String googleMapAPI = "AIzaSyC_qKHmzl-HHB9hr8-fWGmhETSVR2H0894";
}

enum Status { loading, error, completed, internetError, noDataFound }
enum ServiceType { goods, waste, recycle, secondHand}

