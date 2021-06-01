import 'dart:convert';

import 'package:EasyBus/providers/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String authId;
  DateTime expiryTime;
  String token;

  bool get isAuth {
    return Token != null;
  }

  String get Token {
    if (token != null &&
        expiryTime.isAfter(DateTime.now()) &&
        expiryTime != null) {
      return token;
    }
    return null;
  }

  Future<void> authentication(
      String email, String password, String urlType) async {
    try {
      final url = Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:${urlType}?key=AIzaSyCQnKv1hhPXL4JRK4Fcf6KtccN0T4soGEQ');
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final ResponseData = json.decode(response.body);
      print(ResponseData);
      if (ResponseData['error'] != null) {
        throw Exception(ResponseData['error']['message']);
      }
      token = ResponseData['idToken'];
      expiryTime = DateTime.now().add(
        Duration(
          seconds: int.parse(ResponseData['expiresIn']),
        ),
      );
      authId = ResponseData['localId'];
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    return authentication(email, password, "signUp");
  }

  Future<void> Login(String email, String password) async {
    return authentication(email, password, "signInWithPassword");
  }
}
