import 'package:dress_code_picker_demo/ui/theme.dart';
import 'package:dress_code_picker_demo/ui/ui_addmodel.dart';
import 'package:dress_code_picker_demo/ui/ui_pickorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UIHome extends StatefulWidget {
  UIHome({super.key});
  @override
  State<UIHome> createState() {
    return _UIHome();
  }
}

class _UIHome extends State<UIHome> {
  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemeData().colorScheme.secondary,
        foregroundColor: AppThemeData().colorScheme.onSecondary,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shop),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UIPickOrder(),
                ),
              );
            },
          ),
        ],
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppThemeData().colorScheme.primaryContainer,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Image(
                        image: AssetImage('assets/rollin.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppThemeData().colorScheme.primaryContainer,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Image(
                        image: AssetImage('assets/rollin.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppThemeData().colorScheme.primaryContainer,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Image(
                        image: AssetImage('assets/rollin.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UIAddModel(),
                ));
          },
        ),
      ),
    );
  }

  Expanded MainMenuTile(Widget overlay, Function goto) {
    return Expanded(
      flex: 1,
      child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppThemeData().colorScheme.primaryContainer,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: overlay,
              ),
            ],
          )),
    );
  }
}
