import 'package:flutter/material.dart';
// import 'package:tsukuru/api/api_func.dart';
import 'package:tsukuru/screens/authscreens/signupscreen.dart';

import 'package:tsukuru/screens/templatescreen.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool obscure = true;
  double size = 0;
  String text = '';

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Color(0XFFB53145),
        title: UiHelper.customText(
          title: 'Login',
          size: 22,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              Center(
                child: Text(
                  'Welcome back to Tsukuru!!!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Alata",
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 15),
              // Divider(thickness: 4, color: Colors.black),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  border: BoxBorder.all(
                    width: 2,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow[200],
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(26, 5, 2, 2),
                    hint: Text(
                      'Enter Your Email ID',
                      style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  border: BoxBorder.all(
                    width: 2,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow[200],
                ),
                child: TextField(
                  obscureText: obscure,
                  controller: passController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(26, 10, 2, 2),
                    hint: Text(
                      'Enter Your Password',
                      style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      icon: Icon(Icons.remove_red_eye),
                    ),
                    border: InputBorder.none,
                  ),
                  onEditingComplete: () {},
                ),
              ),
              SizedBox(height: 10),
              UiHelper.customText(title: text, size: size, color: Colors.red),
              SizedBox(height: 45),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TemplateScreen(),));
                  // if (emailController.text.trim().isEmpty ||
                  //     passController.text.trim().isEmpty) {
                  //   setState(() {
                  //     text = 'Email or Password fields cannot be empty!';
                  //     size = 18;
                  //   });
                  // } else {
                  //   setState(() {
                  //     text = '';
                  //     size = 0;
                  //   });
                  // }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: UiHelper.customText(
                  title: 'Log In',
                  size: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiHelper.customText(
                    title: "Dont't have an account?",
                    size: 18,
                    color: Colors.black,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Signupscreen()),
                      );
                    },
                    child: UiHelper.customText(
                      title: 'Create Now!',
                      size: 18,
                      color: Color(0XFFB53145),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
