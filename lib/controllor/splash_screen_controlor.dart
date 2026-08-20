import 'package:chatly_ai/helper/pref.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startSplash();
  }

  Future<void> _startSplash() async {
    await Future.delayed(const Duration(seconds: 3));

    if (Pref.showOnboarding) {
      Get.offAllNamed('/onboarding');
    } else {
      Get.offAllNamed('/home');
    }
  }
}
