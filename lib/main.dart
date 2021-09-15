import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/constants/theme_data.dart';
import 'package:productbox_flutter_exercise/model/Provider/ImageProvider.dart';
import 'package:productbox_flutter_exercise/view/dashboard_screen.dart';
import 'package:productbox_flutter_exercise/view/login_screen.dart';
import 'package:productbox_flutter_exercise/view/upload_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => ImagesProvider()),],
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProductBox Flutter Exercise',
      theme: MyThemeData.themeData,
      routes: {
        '/': (context) => const LoginScreen(),
        'UploadScreen': (context) => const UploadScreen(),
        'Dashboard': (context) => const Dashboard(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
