import 'package:flutter/material.dart';

class ApplicationTheme extends InheritedWidget {
  final CustomTextTheme theme;

  const ApplicationTheme(
      {required this.theme, required super.child, super.key});

  static CustomTextTheme of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<ApplicationTheme>();
    assert(result != null, 'no theme found in context');
    return result!.theme;
  }

  @override
  bool updateShouldNotify(ApplicationTheme oldWidget) =>
      theme != oldWidget.theme;
}

class CustomTextTheme {
  final double fontSize;
  final double letterSpacing;
  final Color appBarColor;
  final Color appBarTitleColor;
  final Color bodyBackgroundColor;
  final Color bodyTextColor;
  final Color decorationColor;
  final Color blurColor;
  CustomTextTheme({
    required this.fontSize,
    required this.letterSpacing,
    required this.appBarColor,
    required this.appBarTitleColor,
    required this.bodyBackgroundColor,
    required this.bodyTextColor,
    required this.decorationColor,
    required this.blurColor,
  });
}
