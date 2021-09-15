import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/constants/theme_data.dart';


class Indicators extends StatelessWidget {
  const Indicators({
    required this.flag1,
    required this.flag2,
    required this.flag3,
    required this.flag4,
  }) ;

  final int flag1;
  final int flag2;
  final int flag3;
  final int flag4;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          flag1==0 ?
          Container(
            height: 10,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey),
          )
              : Container(
            height: 10,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: MyThemeData.themeData.primaryColor),
          ),

          flag2==0 ? Container(
            height: 10,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey),
          )
              :
          Container(
            height: 10,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: MyThemeData.themeData.primaryColor),
          ),
          flag3==0 ?
          Container(
            height: 10,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey),
          )
              : Container(
            height: 10,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: MyThemeData.themeData.primaryColor),
          ),

          flag4==0 ? Container(
            height: 10,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey),
          )
              :
          Container(
            height: 10,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: MyThemeData.themeData.primaryColor),
          ),

        ],
      ),
    );
  }
}
