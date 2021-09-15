import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/constants/text_style.dart';
import 'package:productbox_flutter_exercise/constants/theme_data.dart';
import 'package:productbox_flutter_exercise/widgets/LoginButton.dart';
import 'package:productbox_flutter_exercise/widgets/RoundedTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyThemeData.themeData.backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                top: -110,
                left: -80,
                child: Image(
                  height: 300,
                  image: AssetImage("images/splash_icon11.png"),
                ),
              ),
              Positioned(
                top: -10,
                left: -55,
                child: Image(
                  height: 150,
                  image: AssetImage("images/splash_icon5.png"),
                ),
              ),
              Positioned(
                bottom: -45,
                right: -90,
                child: Image(
                  height: 200,
                  image: AssetImage("images/splash_icon3.png"),
                ),
              ),
              Positioned(
                bottom: -175,
                left: -140,
                child: Image(
                  height: 300,
                  image: AssetImage("images/splash_icon1.png"),
                ),
              ),
              Positioned(
                left: 50,
                right: 50,
                top: 170,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Log In",
                        style: kheadingText,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      RoundedTextField(size: size, Controller: emailController, hintText: 'Email Address',),
                      SizedBox(
                        height: 20,
                      ),
                      RoundedTextField(size: size, Controller: passwordController, hintText: 'Password',),

                      SizedBox(
                        height: 20,
                      ),
                      LoginButton(size: size, emailController: emailController, passwordController: passwordController),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Forgot Password?",
                        style: knormalText4,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Register Here",
                        style: knormalText2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}


