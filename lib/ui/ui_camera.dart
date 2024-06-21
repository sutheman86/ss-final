import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';

class UICamera extends StatefulWidget {
	UICamera({super.key});
	@override
	State<UICamera> createState() {
		return _UICamera();
	}
}

class _UICamera extends State<UICamera> {
	@override
	build(context) {
		return Scaffold(
			body: CameraAwesomeBuilder.awesome(
				saveConfig: SaveConfig.photo(
				),
				
			),
		);
	}
}
