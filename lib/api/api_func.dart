import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:tsukuru/constants/constant.dart';
import 'package:tsukuru/models/recipes_models.dart';

// Future perspective to use encryptedBox or secure-storage for tokens

final client = http.Client();

Future<void> updateCsrfToken() async {
  try {
    var csrfResponse = await client.get(Uri.parse("$api/get/csrf-token/"));
    String? csrfToken = csrfResponse.headers['set-cookie']
        ?.split(';')
        .firstWhere((c) => c.trim().startsWith("csrftoken="))
        .split("=")[1];
    var box = await Hive.openBox(tokenBox);
    box.put('csrfToken', csrfToken);
  } catch (e) {
    debugPrint("$e");
  }
}

// Future<void> login(String email, String password) async {
//   var box = await Hive.openBox(tokenBox);
//   String? csrfToken = box.get('csrfToken');
//   var response = await client.post(
//     Uri.parse("$api/auth/login/"),
//     headers: {
//       "Content-Type": "application/json",
//       "X-CSRFToken": csrfToken ?? "",
//       "Cookie": "csrftoken=$csrfToken",
//     },
//     body: jsonEncode(<String, String>{"email": email, "password": password}),
//   );
//
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body);
//     String authToken = data['key'];
//     box.put('loginToken', authToken);
//   }
// }

// Future<String?> singup(
//   String username,
//   String email,
//   String password1,
//   String password2,
// ) async {
//   var box = await Hive.openBox(tokenBox);
//   String? csrfToken = box.get('csrfToken');
//   var response = await client.post(
//     Uri.parse("$api/auth/registration/"),
//     headers: {
//       "Content-Type": "application/json",
//       "X-CSRFToken": csrfToken ?? "",
//       "Cookie": "csrftoken=$csrfToken",
//     },
//     body: jsonEncode(<String, String>{
//       "username": username,
//       "email": email,
//       "password1": password1,
//       "password2": password2,
//     }),
//   );
//   var data = jsonDecode(response.body);
//   print(data);
//   if (data['non_field_errors'] != null) {
//     debugPrint(data['non_field_errors']);
//     return data['non_field_errors'];
//   }
//   return null;
// }

Future<(String, List<Recipe>)> fetchRecipe(String search) async {
  var box = await Hive.openBox(tokenBox);
  String? csrfToken = box.get('csrfToken');
  List<Recipe> recipe = [];
  String detail;
  try {
    http.Response response = await client.get(
      Uri.parse("$api/get/recipe/$search"),
      headers: {
        "Content-Type": "application/json",
        "X-CSRFToken": csrfToken ?? "",
        "Cookie": "csrftoken=$csrfToken",
      },
    );
    var data = jsonDecode(response.body);
    detail = (response.statusCode == 404 || response.statusCode == 400)
        ? "No Recipes Found !"
        : "";
    data.forEach((rcp) {
      Recipe r = Recipe(
        id: rcp['id'] ?? 0,
        title: rcp['title'] ?? "",
        ingredients: List<String>.from(rcp['cleaned_ingredients'] ?? []),
        directions: rcp['directions'] ?? "",
        imgname: rcp['image_name'] ?? "",
        image: rcp['image'] ?? "",
      );
      recipe.add(r);
    });
    return (detail, recipe);
  } catch (e) {
    Recipe r = Recipe(
      id: 0,
      title: "",
      ingredients: [],
      directions: "",
      imgname: "",
      image: "",
    );
    recipe.add(r);
    detail = "An Error Occurred : $e";
    return (detail, recipe);
  }
}

Future<(String, List<Recipe>)> fetchLimitedRecipe(String search,
    int count) async {
  var box = await Hive.openBox(tokenBox);
  String? csrfToken = box.get('csrfToken');
  List<Recipe> recipe = [];
  String detail;
  try {
    http.Response response = await client.get(
      Uri.parse("$api/get/recipe/$search/$count"),
      headers: {
        "Content-Type": "application/json",
        "X-CSRFToken": csrfToken ?? "",
        "Cookie": "csrftoken=$csrfToken",
      },
    );
    var data = jsonDecode(response.body);
    detail = (response.statusCode == 404 || response.statusCode == 400)
        ? "No Recipes Found !"
        : "";
    data.forEach((rcp) {
      Recipe r = Recipe(
        id: rcp['id'] ?? 0,
        title: rcp['title'] ?? "",
        ingredients: List<String>.from(rcp['cleaned_ingredients'] ?? []),
        directions: rcp['directions'] ?? "",
        imgname: rcp['image_name'] ?? "",
        image: rcp['image'] ?? "",
      );
      recipe.add(r);
    });
    return (detail, recipe);
  } catch (e) {
    Recipe r = Recipe(
      id: 0,
      title: "",
      ingredients: [],
      directions: "",
      imgname: "",
      image: "",
    );
    recipe.add(r);
    detail = "An Error Occurred : $e";
    return (detail, recipe);
  }
}
