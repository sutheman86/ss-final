import 'package:flutter/material.dart';
import 'package:dress_code_picker_demo/ui/ui_home.dart';
import 'package:dress_code_picker_demo/ui/ui_tip.dart';
import 'package:dress_code_picker_demo/data/data_user_appconfig.dart';
import 'package:dress_code_picker_demo/ui/theme.dart';

void main() {
  runApp(DressCodePickerApp());
}

class DressCodePickerApp extends StatefulWidget {
  DressCodePickerApp({super.key});
  @override
  State<DressCodePickerApp> createState() {
    return _DressCodePickerApp();
  }
}

class _DressCodePickerApp extends State<DressCodePickerApp> {
  final AppConfig config = AppConfig();

  MaterialApp buildHomeScreen(Widget home) {
    return MaterialApp(
      theme: AppThemeData(),
      debugShowCheckedModeBanner: false,
      home: home,
    );
  }

  @override
  Widget build(context) {
    if (config.isTipPopupEnabled) {
      return buildHomeScreen(UITips());
    } else {
      return buildHomeScreen(UIHome());
    }
  }
}
