import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/constants/text_style.dart';
import 'package:productbox_flutter_exercise/constants/theme_data.dart';
import 'package:productbox_flutter_exercise/controller/controller.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({
    required this.size,
    required this.emailController,
    required this.passwordController,
  }) ;

  final Size size;
  final TextEditingController emailController;
  final TextEditingController passwordController;


  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: size.width * 0.8, height: 50),
      child: ElevatedButton(
        child: Text('Login'),
        onPressed: () async {
          Logincontroller c = Logincontroller();
          String message = await c.checkcredentials(
              emailController.text, passwordController.text);
          if (message == "success") {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.SCALE,
              headerAnimationLoop: false,
              title: 'Sign in Successful',
              desc: '',
              // autoHide: Duration(milliseconds: 4000) ,
            )..show();
            Future.delayed(Duration(seconds: 3),() async {
              await  Navigator.pushReplacementNamed(context, 'UploadScreen');
            });
          }
          else if (message!="success"){
            AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.TOPSLIDE,
              headerAnimationLoop: false,
              title: 'Sign in UnSuccessful"',
              desc: '',
              autoHide: Duration(seconds: 3) ,
            )..show();
          }

        },
        style: ElevatedButton.styleFrom(
            primary: MyThemeData.themeData.primaryColor,
            fixedSize: Size(260, 50),
            padding: EdgeInsets.symmetric(horizontal: 50),
            textStyle: kheadingText2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
      ),
    );
  }

}
