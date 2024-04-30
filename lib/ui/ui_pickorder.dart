import 'package:dress_code_picker_demo/ui/ui_search.dart';
import 'package:flutter/material.dart';
import 'package:dress_code_picker_demo/ui/theme.dart';

class UIPickOrder extends StatefulWidget {
  UIPickOrder({super.key});
  @override
  State<UIPickOrder> createState() {
    return _UIPickOrder();
  }
}

class _UIPickOrder extends State<UIPickOrder> {
  final DressCodeSets dressCodeSets = DressCodeSets();
  @override
  build(context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        padding: EdgeInsets.all(20.0),
        itemBuilder: (context, index) {
          return dressCodeSets.createItem(context, index);
        },
      ),
      appBar: AppBar(
        backgroundColor: AppThemeData().colorScheme.secondary,
        foregroundColor: AppThemeData().colorScheme.onSecondary,
        title: Text("Cart"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                width: 200,
                height: 100,
                child: Text(
                  "\$ 1234",
                  style: AppThemeData().textTheme.bodyLarge,
                )),
            Spacer(),
            TextButton(
              child: Text('order'),
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Congrats!")));
              },
            )
          ],
        ),
      ),
    );
  }
}
