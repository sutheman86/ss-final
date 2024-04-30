import 'package:dress_code_picker_demo/ui/ui_pickorder.dart';
import 'package:flutter/material.dart';

class UIPreview extends StatefulWidget {
  UIPreview({super.key});
  @override
  State<UIPreview> createState() {
    return _UIPreview();
  }
}

class _UIPreview extends State<UIPreview> {
  @override
  build(context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage('assets/preview.png'),
            )),
        // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        // floatingActionButton: Padding(
        //   padding: EdgeInsets.only(top: AppBar().preferredSize.height),
        //   child: FloatingActionButton(
        //     onPressed: () {},
        //   ),
        // ),
        appBar: AppBar(actions: <Widget>[
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.shop),
          // ),
        ]),
        bottomNavigationBar: BottomAppBar(
            child: Center(
          child: Row(
            children: <Widget>[
              Container(
                width: 200,
                height: 50,
                alignment: Alignment.center,
                child: Text("\$ 696"),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.save),
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
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
          ),
        )));
  }
}
