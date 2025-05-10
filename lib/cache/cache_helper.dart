
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late final SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }
  static saveEligibility(){
    prefs.setBool("onboarding",true);
  }
  static bool? getEligibility(){
    return prefs.getBool("onboarding");
  }
}