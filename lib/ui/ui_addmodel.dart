import 'dart:ffi';

import 'package:dress_code_picker_demo/ui/theme.dart';
import 'package:dress_code_picker_demo/ui/ui_search.dart';
import 'package:flutter/material.dart';

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UISearch(),
                  ));
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
                      onPressed: () {
                        setState(() {
                          isenabled = true;
                          _height = "183";
                          _weight = "76";
                        });
                      },
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
