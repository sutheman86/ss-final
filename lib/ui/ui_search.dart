import 'package:dress_code_picker_demo/ui/theme.dart';
import 'package:dress_code_picker_demo/ui/ui_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UISearch extends StatefulWidget {
  UISearch({super.key});
  @override
  State<UISearch> createState() {
    return _UISearch();
  }
}

class _UISearch extends State<UISearch> {
  DressCodeSets dressCodeSets = DressCodeSets();
  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  build(context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 20,
            itemExtent: 200,
            padding: EdgeInsets.all(20.0),
            itemBuilder: (context, index) {
              return dressCodeSets.createItem(context, index);
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 0.3 * AppBar().preferredSize.height),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppThemeData().secondaryHeaderColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 200,
                    height: 0.8 * AppBar().preferredSize.height,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("more filters..."),
                        )),
                  ),
                  Spacer(),
                  IconButton(
                    alignment: Alignment.center,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Not implemented yet..."),
                        ),
                      );
                      if (true) return;
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).viewInsets.bottom),
                            child: SizedBox(
                              child: Wrap(
                                direction: Axis.vertical,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: 'min',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: 'min',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.tune),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DressCodeSets {
  Widget createItem(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: SizedBox(
          height: 160,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image(
                        image: AssetImage('assets/model${index % 3 + 1}.jpg')),
                  )),
              Expanded(
                flex: 2,
                child: Center(child: Text('item${index}')),
              ),
            ],
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UIPreview(),
            ),
          );
        },
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Container(
        width: 0.8 * MediaQuery.of(context).size.width,
        height: 0.8 * MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What do people call you?',
                labelText: 'Name *',
              ),
            ),
            SizedBox(width: 100, height: 50),
            // Add TextFormFields and ElevatedButton here.
          ],
        ),
      ),
    );
  }
}
