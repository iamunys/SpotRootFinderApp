// ignore_for_file: file_names
import 'dart:convert';

import 'package:spotrootpartner/constant/constant.dart';
import 'package:http/http.dart' as http;

class AuthApiProvider {
  static Future<bool> signUpApi(
      {required String userName,
      required String fullName,
      required String placeName,
      required String phoneNumber}) async {
    final reqBody = {
      "userName": userName,
      "fullName": fullName,
      "placeName": placeName,
      "phoneNumber": phoneNumber
    };
    final response = await http.post(
      Uri.parse('${Constant.apiLocalHost}/registration'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(reqBody),
    );
    print('ddddddddddddddddddd: ${response.statusCode}');
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> checkUserName({
    required String userName,
  }) async {
    final reqBody = {
      "userName": userName,
    };
    final response = await http.post(
      Uri.parse('${Constant.apiLocalHost}/checkUsername'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(reqBody),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
