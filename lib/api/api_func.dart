import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:tsukuru/constants/constant.dart';
import 'package:tsukuru/widgets/status_snackbar.dart';

final client = http.Client();

Future<void> updateCsrfToken() async {
  try {
    var csrfResponse = await client.get(Uri.parse("$api/get/csrf-token/"));
    String? csrfToken = csrfResponse.headers['set-cookie']
        ?.split(';')
        .firstWhere((c) => c.trim().startsWith("csrftoken="))
        .split("=")[1];
    print(csrfToken);
    var box = await Hive.openBox(tokenBox);
    box.put('csrfToken', csrfToken);
  } catch (e) {
    print(e);
  }
}

Future<void> login(String email, String password) async {
  var box = await Hive.openBox(tokenBox);
  String? csrfToken = box.get('csrfToken');
  var response = await client.post(
    Uri.parse("$api/auth/login/"),
    headers: {
      "Content-Type": "application/json",
      "X-CSRFToken": csrfToken ?? "",
      "Cookie": "csrftoken=$csrfToken",
    },
    body: jsonEncode(<String, String>{"email": email, "password": password}),
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    String authToken = data['key'];
    box.put('loginToken', authToken);
  }
}

Future<String?> singup(
  String username,
  String email,
  String password1,
  String password2,
) async {
  var box = await Hive.openBox(tokenBox);
  String? csrfToken = box.get('csrfToken');
  var response = await client.post(
    Uri.parse("$api/auth/registration/"),
    headers: {
      "Content-Type": "application/json",
      "X-CSRFToken": csrfToken ?? "",
      "Cookie": "csrftoken=$csrfToken",
    },
    body: jsonEncode(<String, String>{
      "username": username,
      "email": email,
      "password1": password1,
      "password2": password2,
    }),
  );
  var data = jsonDecode(response.body);
  print(data);
  if (data['non_field_errors'] != null) {
    debugPrint(data['non_field_errors']);
    return data['non_field_errors'];
  }
  return null;
}

Future<void> verifyEmail(String code, String email) async {
  var box = await Hive.openBox(tokenBox);
  String? csrfToken = box.get('csrfToken');
  var response = await client.post(
    Uri.parse("$api/auth/verify-email-code/"),
    headers: {
      "Content-Type": "application/json",
      "X-CSRFToken": csrfToken ?? "",
      "Cookie": "csrftoken=$csrfToken",
    },
    body: jsonEncode({
      "email": email,
      "code": code, // user entered OTP
    }),
  );
  print(response.body);
  print(response.statusCode);
  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    SnackbarService.show(data["detail"], Colors.green[400]!);
  } else if (response.statusCode == 400) {
    SnackbarService.show(data["detail"], Colors.red[400]!);
  } else if (response.statusCode == 404) {
    SnackbarService.show(data["detail"], Colors.red[400]!);
  }
}

Future<void> resendCode(String email) async {
  var box = await Hive.openBox(tokenBox);
  String? csrfToken = box.get('csrfToken');
  var response = await client.post(
    Uri.parse("$api/auth/resend-email-code/"),
    headers: {
      "Content-Type": "application/json",
      "X-CSRFToken": csrfToken ?? "",
      "Cookie": "csrftoken=$csrfToken",
    },
    body: jsonEncode({"email": email}),
  );
  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    SnackbarService.show(data["detail"], Colors.green[400]!);
  } else if (response.statusCode == 400) {
    SnackbarService.show(data["detail"], Colors.red[400]!);
  } else if (response.statusCode == 404) {
    SnackbarService.show(data["detail"], Colors.red[400]!);
  }
}
