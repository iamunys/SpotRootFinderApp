// ignore_for_file: file_names
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:spotrootpartner/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:spotrootpartner/model/getUserSpot.dart';

class SpotApiProvider {
  static Future<bool> createASpot(
      {required String id,
      required String imageId,
      required String currentLocation,
      required String landMark,
      required String spotName,
      required String spotDescription,
      required List<String> spotType,
      required String isHaveEntryTime,
      required String entryTimeDetails,
      required String isOpenAllDay,
      required String entryOpenDaysDetails,
      required String isHaveAnyCost,
      required String costDetails,
      required String isFamilyFriendly,
      required String isFoodHold,
      required String whatHave,
      required String visitAgain,
      required String visitAgainDetails,
      required List<String> bestMonths,
      required List<String> bestTimes,
      required String moreAbout,
      required String addedDate,
      required List<String> spoImg,
      required bool adminApproved}) async {
    final reqBody = {
      "finderId": id,
      "imageId": imageId,
      "currentLocation": currentLocation,
      "landMark": landMark,
      "spotName": spotName,
      "spotDescription": spotDescription,
      "spotType": spotType,
      "isHaveEntryTime": isHaveEntryTime,
      "entryTimeDetails": entryTimeDetails,
      "isOpenAllDay": isOpenAllDay,
      "entryOpenDaysDetails": entryOpenDaysDetails,
      "isHaveAnyCost": isHaveAnyCost,
      "costDetails": costDetails,
      "isFamilyFriendly": isFamilyFriendly,
      "isFoodHold": isFoodHold,
      "whatHave": whatHave,
      "visitAgain": visitAgain,
      "visitAgainDetails": visitAgainDetails,
      "bestMonths": bestMonths,
      "bestTime": bestTimes,
      "moreAbout": moreAbout,
      "addedDate": addedDate,
      "spotImg": spoImg,
      "adminApproved": adminApproved
    };
    final response = await http.post(
      Uri.parse('${Constant.apiLocalHost}/createSpot'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(reqBody),
    );
    debugPrint('Create Spot : ${response.statusCode}');
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<Spot>> getSpots({
    required String id,
  }) async {
    final reqBody = {"finderId": id};
    final response = await http.post(
      Uri.parse('${Constant.apiLocalHost}/getSpots'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(reqBody),
    );
    debugPrint('Create Spot : ${response.body}');
    if (response.statusCode == 201) {
      var body = jsonDecode(response.body);
      final parsed = List<Spot>.from(body['data'].map((item) => Spot.fromJson(item))).reversed.toList();
      return parsed;
    } else {
      return [];
    }
  }
}
