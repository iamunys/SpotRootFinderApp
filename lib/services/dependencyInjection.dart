import 'package:get/get.dart';
import 'package:spotrootpartner/controllers/networkController.dart';

class DependancyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
