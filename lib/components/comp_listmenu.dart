import 'package:flutter/material.dart';
import 'package:dress_code_picker_demo/ui/theme.dart';

AppBar GlobalAppBar() {
  return AppBar(
    backgroundColor: AppThemeData().primaryColor,
    titleTextStyle: AppThemeData().textTheme.titleLarge,
    centerTitle: true,
    title: Text("Home"),
    leading: IconButton(
      icon: const Icon(Icons.abc),
      onPressed: () {},
    ),
    actions: <Widget>[],
  );
}
