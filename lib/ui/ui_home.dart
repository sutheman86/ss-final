import 'package:dress_code_picker_demo/services/navigation.dart';
import 'package:dress_code_picker_demo/ui/theme.dart';
import 'package:dress_code_picker_demo/ui/ui_addmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dress_code_picker_demo/services/navigation.dart';

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
        /*
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        */
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shop),
            onPressed: () => Provider.of<NavigationService>(context, listen: false)
							.go("pickorder"),
          ),
        ],
        title: const Text("Home"),
        centerTitle: true,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppThemeData().colorScheme.primary,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: AppThemeData().colorScheme.onPrimary,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);  // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add Model'),
              onTap: () {
                Navigator.pop(context);  // Close the drawer
                Provider.of<NavigationService>(context, listen: false).go("addmodel");
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search'),
              onTap: () {
                Navigator.pop(context);  // Close the drawer
                Provider.of<NavigationService>(context, listen: false).go("search");
              },
            ),
          ],
        ),
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
          onPressed: () => Provider.of<NavigationService>(context, listen: false)
						.go("addmodel"),
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
