import 'package:flutter/material.dart';
import 'package:tsukuru/api/api_func.dart';
import 'package:tsukuru/screens/authscreens/loginscreen.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pass1Controller = TextEditingController();
  TextEditingController pass2Controller = TextEditingController();
  bool obscure = true;

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
                  controller: usernameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(26, 5, 2, 2),
                    hint: Text(
                      'Enter Your Username',
                      style: TextStyle(fontSize: 18, color: Colors.black),
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
                  controller: emailController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(26, 5, 2, 2),
                    hint: Text(
                      'Enter Your Email ID',
                      style: TextStyle(fontSize: 18, color: Colors.black),
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
                  controller: pass1Controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(26, 10, 2, 2),
                    hint: Text(
                      'Enter Your Password',
                      style: TextStyle(fontSize: 18, color: Colors.black),
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
                  controller: pass1Controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(26, 10, 2, 2),
                    hint: Text(
                      'Re-Enter Your Password',
                      style: TextStyle(fontSize: 18, color: Colors.black),
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
              SizedBox(height: 45),
              ElevatedButton(
                onPressed: () {
                  singup(
                    usernameController.text,
                    emailController.text,
                    pass1Controller.text,
                    pass2Controller.text,
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: UiHelper.customText(
                  title: 'Sign Up',
                  size: 18,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiHelper.customText(
                    title: "Already Have An Account?",
                    size: 18,
                    color: Colors.black,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: UiHelper.customText(
                      title: 'Login Now!',
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
