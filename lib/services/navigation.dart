import 'package:dress_code_picker_demo/ui/ui_addmodel.dart';
import 'package:dress_code_picker_demo/ui/ui_camera.dart';
import 'package:dress_code_picker_demo/ui/ui_pickorder.dart';
import 'package:dress_code_picker_demo/ui/ui_preview.dart';
import 'package:dress_code_picker_demo/ui/ui_search.dart';
import 'package:dress_code_picker_demo/ui/ui_tip.dart';
import 'package:dress_code_picker_demo/ui/ui_config.dart';
import 'package:go_router/go_router.dart';
import 'package:dress_code_picker_demo/ui/ui_home.dart';

GoRouter routerConfig = GoRouter(initialLocation: '/tip', routes: [
		GoRoute(
			name: 'home',
			path: '/home',
			builder: (context, state) => UIHome(),
			),
		GoRoute(
			name: 'preview',
			path: '/preview',
			builder: (context, state) => const UIPreview(),
			),
		GoRoute(
			name: 'addmodel',
			path: '/addmodel',
			builder: (context, state) => UIAddModel(),
			),
		GoRoute(
			name: 'tip',
			path: '/tip',
			builder: (context, state) => UITips(),
			),
		GoRoute(
				name: 'search',
				path: '/search',
				builder: (context, state) => UISearch(),
				),
		GoRoute(
				name: 'pickorder',
				path: '/pickorder',
				builder: (context, state) => UIPickOrder(),
				),
		GoRoute(
				name: 'config',
				path: '/config',
				builder: (context, state) => const UIConfig(),
				),
		GoRoute(
				name: 'addmodel_camera',
				path: '/addmodel/camera',
				builder: (context, state) => UICamera(),
				),

		]);

class NavigationService {
	late final GoRouter _router;

	NavigationService() {
		_router = routerConfig;
	}

	void go(String name) {
		switch (name) {
			case 'tip':
				_router.goNamed('tip');
				break;
			case 'home':
				_router.goNamed('home');
				break;
			case 'search':
				_router.goNamed('search');
				break;
			case 'config':
				_router.goNamed('config');
				break;
			case 'pickorder':
				_router.goNamed('pickorder');
				break;
			case 'preview':
				_router.goNamed('preview');
				break;
			case 'addmodel':
				_router.goNamed('addmodel');
				break;
			case 'addmodel_camera':
				_router.goNamed('addmodel_camera');
				break;
		}
	}

	void replace(String name) {
		switch (name) {
			case 'home':
				_router.replace('/home');
				break;
		}
	}
}
