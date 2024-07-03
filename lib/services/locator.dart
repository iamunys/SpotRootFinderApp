import 'package:get/get.dart';
import 'package:spotrootpartner/controllers/apiController.dart';
import 'package:spotrootpartner/controllers/networkController.dart';
import 'package:spotrootpartner/controllers/userStateController.dart';

serviceLocator() {
  Get.lazyPut(() => NetworkController(), fenix: true);
  Get.lazyPut(() => UserStateController(), fenix: true);
  Get.lazyPut(() => ApiController(), fenix: true);

}
