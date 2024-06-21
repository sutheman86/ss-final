/*
import 'package:dress_code_picker_demo/services/navigation.dart';
import 'package:dress_code_picker_demo/ui/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';

class UIAddModel extends StatefulWidget {
  UIAddModel({super.key});
  @override
  State<UIAddModel> createState() {
    return _UIAddModel();
  }
}

class _UIAddModel extends State<UIAddModel> {
  bool isenabled = false;
  String _height = "???";
  String _weight = "???";


  void requestStoragePermission() async {
    if (!kIsWeb) {
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }

			var cameraStatus = await Permission.camera.status;
			if (cameraStatus.isPermanentlyDenied) {
				if(mounted) {
					showDialog(
							context: context,
							builder: (BuildContext context) {
							return AlertDialog(
								title: const Text('Permission Required'),
								content: const SingleChildScrollView(
									child: ListBody(
										children: <Widget>[
										Text('Please Enable Camera Permission:'),
										Text('Settings > Apps > Permissions'),
										],
										)
									),
								actions: <Widget>[
								TextButton(
									child: const Text('OK'),
									onPressed: () {
									Navigator.of(context).pop();
									},
									),
								],
								);
							}
					);
				}
				openAppSettings();
			}
			else if (!cameraStatus.isGranted) {
				await Permission.camera.request();
			}
		}
	}

	@override
		void initState() {
			super.initState();
			requestStoragePermission();
		}

	@override
		build(context) {
			return Scaffold(
					appBar: AppBar(),
					floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
					floatingActionButton: Padding(
						padding: const EdgeInsets.all(8.0),
						child: FloatingActionButton(
							child: Center(
								child: Icon(Icons.check),
								),
							onPressed: () {
							if (isenabled) {
							Provider.of<NavigationService>(context, listen: false)
							.go("search");
							} else
							ScaffoldMessenger.of(context).showSnackBar(
									SnackBar(content: Text("please take a picture first")));
							},
							),
						),
					body: Column(
						children: [
						Expanded(
							flex: 1,
							child: Padding(
								padding: const EdgeInsets.all(8.0),
								child: AspectRatio(
									aspectRatio: 1,
									child: Container(
										alignment: Alignment.center,
										decoration: BoxDecoration(
											color: AppThemeData().disabledColor,
											borderRadius: BorderRadius.circular(10),
											),
										child: isenabled
										? Image(image: AssetImage('assets/wojakfull.png'))
										: Container(),
										),
									),
								)),
						Expanded(
							flex: 1,
							child: Column(
								children: [
								Expanded(
									flex: 1,
									child: AspectRatio(
										aspectRatio: 3,
										child: IconButton(
											style: IconButton.styleFrom(
												foregroundColor: AppThemeData().colorScheme.onPrimary,
												backgroundColor: AppThemeData().colorScheme.primary,
												),
											icon: Icon(Icons.camera),
											onPressed: () => Provider.of<NavigationService>(context, listen: false)
											.go("addmodel_camera"),
											),
										),
									),
								Expanded(
									flex: 5,
									child: Table(
										children: <TableRow>[
										TableRow(
											children: [
											Center(
												child: Padding(
													padding: const EdgeInsets.all(8.0),
													child: Padding(
														padding: const EdgeInsets.all(8.0),
														child: Text('Height:'),
														),
													)),
											Center(child: Text('${_height}'))
											],
											),
										TableRow(
											children: [
											Center(
												child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Weight:'),
                          )),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${_weight}'),
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/

import 'package:dress_code_picker_demo/ui/theme.dart';
import 'package:dress_code_picker_demo/ui/ui_search.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class UIAddModel extends StatefulWidget {
  const UIAddModel({super.key});
  @override
  State<UIAddModel> createState() {
    return _UIAddModel();
  }
}

class _UIAddModel extends State<UIAddModel> {
  bool isenabled = false;
  String _height = "???";
  String _weight = "???";
  File? _selectedImage;

  Future<void> _pickImage() async {
    try {
      final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxWidth: 150,
      );

      if (pickedImage == null) {
        return;
      }

      setState(() {
        _selectedImage = File(pickedImage.path);
        isenabled = true;
        _height = "183"; // 根據實際需求設置這些值
        _weight = "76";
      });
    } catch (error) {
      debugPrint('Error picking image: $error');
    }
  }
  
  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          child: const Center(
            child: Icon(Icons.check),
          ),
          onPressed: () {
            if (isenabled) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UISearch(),
                  ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("please take a picture first")));
            }
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppThemeData().disabledColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    /*
                    child: isenabled
                        ? const Image(image: AssetImage('assets/wojakfull.png'))
                        : Container(),
                    */
                    child: _selectedImage != null
                      ? kIsWeb
                          ? Image.network(_selectedImage!.path)
                          : Image.file(_selectedImage!)
                      : Container(),
                  ),
                ),
              )),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 3,
                    child: IconButton(
                      style: IconButton.styleFrom(
                        foregroundColor: AppThemeData().colorScheme.onPrimary,
                        backgroundColor: AppThemeData().colorScheme.primary,
                      ),
                      icon: const Icon(Icons.camera),
                      onPressed: _pickImage,
                      /*
                      onPressed: () {
                        setState(() {
                          isenabled = true;
                          _height = "183";
                          _weight = "76";
                        });
                      },
                      */
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Table(
                    children: <TableRow>[
                      TableRow(
                        children: [
                          const Center(
                              child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Height:'),
                            ),
                          )),
                          Center(child: Text(_height))
                        ],
                      ),
                      TableRow(
                        children: [
                          const Center(
                              child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Weight:'),
                          )),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(_weight),
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
