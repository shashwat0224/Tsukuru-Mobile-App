import 'package:flutter/material.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pass1Controller = TextEditingController();
  TextEditingController pass2Controller = TextEditingController();
  String error1Text = ' ';
  String error2Text = ' ';
  bool obscure = true;

  void validatePass() {
    if (pass1Controller.text.length < 8) {
      setState(() {
        error1Text = 'Password Too Small';
      });
    } else {
      setState(() {
        error1Text = ' ';
      });
    }
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
                    contentPadding: EdgeInsets.only(left: 8),
                    hint: UiHelper.customText(
                      title: '     Enter Your Email ID',
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
                  controller: pass1Controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 8),
                    hint: UiHelper.customText(
                      title: '     Enter Your Password',
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
                  onEditingComplete: () {
                    if (pass1Controller.text.length < 8) {
                      setState(() {
                        error1Text = '\nPassword Too Small\n';
                      });
                    } else {
                      setState(() {
                        error1Text = ' ';
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 10),
              UiHelper.customText(
                title: error1Text,
                size: 18,
                color: Colors.redAccent,
              ),
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
                    contentPadding: EdgeInsets.only(left: 8),
                    hint: UiHelper.customText(
                      title: '     Re-Enter Your Password',
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
                  onEditingComplete: () {
                    if (pass1Controller.text.length < 8) {
                      setState(() {
                        error1Text = '\nPassword Too Small\n';
                      });
                    } else {
                      setState(() {
                        error1Text = ' ';
                      });
                    }
                  },
                ),
              ),SizedBox(height: 10),
              UiHelper.customText(
                title: error2Text,
                size: 18,
                color: Colors.redAccent,
              ),
              SizedBox(height: 45),
              ElevatedButton(
                onPressed: () {},
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
                    title: "Already Have An Account?",
                    size: 18,
                    color: Colors.black,
                  ),
                  TextButton(
                    onPressed: () {},
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
