import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPlaceController extends GetxController {
  final spotNameController = TextEditingController();
  final aboutSpotController = TextEditingController();
  final writtenMapController = TextEditingController();
  final entryTimeController = TextEditingController();
  final costController = TextEditingController();
  final whatHaveController = TextEditingController();
  final bestTimeController = TextEditingController();
  final openDayController = TextEditingController();
  final currentSituation = TextEditingController();

  bool _isEnd = false;
  bool _isFirst = true;
  bool _checkOne = false;
  bool _checkTwo = false;
  bool _isUploading = false;

  @override
  void onClose() {
    spotNameController.dispose();
    writtenMapController.dispose();
    entryTimeController.dispose();
    costController.dispose();
    whatHaveController.dispose();
    bestTimeController.dispose();
    openDayController.dispose();
    currentSituation.dispose();
    super.onClose();
  }

  bool get isFirst => _isFirst;
  set isFirst(bool v) {
    _isFirst = v;
    update();
  }

  bool get isEnd => _isEnd;
  set isEnd(bool v) {
    _isEnd = v;
    update();
  }

  bool get checkOne => _checkOne;
  set checkOne(bool v) {
    _checkOne = v;
    update();
  }

  bool get checkTwo => _checkTwo;
  set checkTwo(bool v) {
    _checkTwo = v;
    update();
  }

  bool get isUploading => _isUploading;
  set isUploading(bool v) {
    _isUploading = v;
    update();
  }
}
