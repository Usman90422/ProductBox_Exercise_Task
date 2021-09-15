import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/constants/theme_data.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    Key? key,
    required this.size,
    required this.Controller,
    required this.hintText,
  }) : super(key: key);

  final Size size;
  final TextEditingController Controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: size.width * 0.8,
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: TextField(
        controller: Controller,
        cursorColor: MyThemeData.themeData.backgroundColor,
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(horizontal: 10),
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
