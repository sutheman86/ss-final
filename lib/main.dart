import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dress_code_picker_demo/services/navigation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart';

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
  @override
	void initState() {
		super.initState();
	}

	Widget build(BuildContext context) {
		return MultiProvider(
				providers: [
				Provider<NavigationService>(
					create: (_) => NavigationService(),
					),
				],
				child: MaterialApp.router(
					debugShowCheckedModeBanner: false,
					routerConfig: routerConfig,
					),
				);
	}
}

/* class _DressCodePickerApp extends State<DressCodePickerApp> {
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
} */
