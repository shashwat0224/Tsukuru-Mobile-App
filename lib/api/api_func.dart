import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:tsukuru/constants/constant.dart';

final client = http.Client();
Future<void> updateCsrfToken() async {
  var csrfResponse = await client.get(Uri.parse("$api/get/csrf-token/"));
  String? csrfToken = csrfResponse.headers['set-cookie']
      ?.split(';')
      .firstWhere((c) => c.trim().startsWith("csrftoken="))
      .split("=")[1];

  var box = await Hive.openBox(tokenBox);
  box.put('csrftToken', csrfToken);
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

void singup(
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

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    String authToken = data['key'];
    box.put('loginToken', authToken);
  }
}
