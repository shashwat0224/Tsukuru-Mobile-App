import 'package:flutter/material.dart';
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
  String errorText = ' ';
  bool obscure = true;
  void validatePass() {
    if (passController.text.length < 8) {
      setState(() {
        errorText = 'Password Too Small';
      });
    } else {
      setState(() {
        errorText = ' ';
      });
    }
  }

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
                  'Welcome back\n to Tsukuru!!!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    fontFamily: "AmaticSC",
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
                    contentPadding: EdgeInsets.fromLTRB(26, 8, 2, 2),
                    hint: UiHelper.customText(
                      title: 'rudrEnter Your Email ID',
                      size: 18,
                      color: Colors.black,
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
                    contentPadding: EdgeInsets.fromLTRB(26, 8, 2, 2),
                    hint: UiHelper.customText(
                      title: 'Enter Your Password',
                      size: 18,
                      color: Colors.black,
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
                  onEditingComplete: () => validatePass(),
                ),
              ),
              SizedBox(height: 10),
              UiHelper.customText(
                title: errorText,
                size: 18,
                color: Colors.redAccent,
              ),
              SizedBox(height: 45),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => TemplateScreen()),
                  );
                },
                child: UiHelper.customText(
                  title: 'Login',
                  size: 18,
                  color: Colors.black,
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiHelper.customText(
                    title: "Dont't have an account?",
                    size: 18,
                    color: Colors.black,
                  ),
                  TextButton(
                    onPressed: () {},
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
