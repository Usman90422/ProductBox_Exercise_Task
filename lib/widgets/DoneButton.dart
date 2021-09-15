import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/constants/text_style.dart';
import 'package:productbox_flutter_exercise/constants/theme_data.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({
    required this.size,
    required this.flag1,
    required this.flag2,
    required this.flag3,
    required this.flag4,
  }) ;

  final Size size;
  final int flag1;
  final int flag2;
  final int flag3;
  final int flag4;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: flag1 == 1 && flag2 == 1 && flag3 == 1 && flag4 == 1
          ? ConstrainedBox(
        constraints: BoxConstraints.tightFor(
            width: size.width * 0.8, height: 50),
        child: ElevatedButton(
          child: Text('Done'),
          onPressed: () {
            Navigator.pushNamed(context, 'Dashboard');
          },
          style: ElevatedButton.styleFrom(
              primary: MyThemeData.themeData.primaryColor,
              fixedSize: Size(260, 50),
              padding: EdgeInsets.symmetric(horizontal: 50),
              textStyle: kheadingText2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
        ),
      )
          : Container(
        width: size.width * 0.8,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            "Done",
            style: kheadingText2,
          ),
        ),
      ),

    );
  }
}

