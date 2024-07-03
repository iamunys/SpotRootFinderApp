import 'package:get/get.dart';

class WidgetsController extends GetxController {
  int _bottonNavIndex = 0;
  bool _isUserNameAvailable = false;

  int get bottomNavIndex => _bottonNavIndex;
  set bottomNavIndex(int v) {
    _bottonNavIndex = v;
    update();
  }

  bool get isUserNameAvailable => _isUserNameAvailable;
  set isUserNameAvailable(bool v) {
    _isUserNameAvailable = v;
    update();
  }
}
