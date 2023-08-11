import 'package:flutter/material.dart';
import 'package:flutter_application_pw14/screens/home_page.dart';
import 'package:flutter_application_pw14/theme/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ApplicationTheme(
        theme: CustomTextTheme(
            fontSize: 20,
            letterSpacing: 2.2,
            appBarColor: Colors.red,
            appBarTitleColor: Colors.black,
            bodyBackgroundColor: const Color.fromARGB(179, 228, 218, 218),
            bodyTextColor: Colors.indigo,
            decorationColor: Colors.lime,
            blurColor: Colors.orange),
        child: Builder(builder: (context) => const MyHomePage()),
      ),
    );
  }
}
