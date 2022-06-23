import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  Future<Map<String, dynamic>> register(
      String fullName, String phoneNumber, String email, String pass) async {
    try {
      Map<String, String> body = {
        "full_name": fullName,
        "phone_number":
            phoneNumber, // add +91 in the prefix and then a space and then the 10 digit number
        "email": email,
        "password": pass
      };
      var response = await http.post(
        Uri.parse(
          'https://carego-healthcare.herokuapp.com/register',
        ),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );
      var extractedData = json.decode(response.body) as Map<String, dynamic>;
      return extractedData;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> login(String phoneNumber, String pass) async {
    try {
      Map<String, String> body = {
        'phone_number':
            phoneNumber, // add +91 in the prefix and then a space and then the 10 digit number
        'password': pass,
      };
      var response = await http.post(
        Uri.parse(
          'https://carego-healthcare.herokuapp.com/login',
        ),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );
      var extractedData = json.decode(response.body) as Map<String, dynamic>;
      return extractedData;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> otpVerification(String userOtp) async {
    try {
      Map<String, String> body = {"otp": userOtp};
      var response = await http.post(
        Uri.parse(
          'https://carego-healthcare.herokuapp.com/otp',
        ),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );
      var extractedData = json.decode(response.body) as Map<String, dynamic>;
      return extractedData;
    } catch (e) {
      rethrow;
    }
  }
}
