import 'package:dress_code_picker_demo/services/navigation.dart';
import 'package:dress_code_picker_demo/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:dress_code_picker_demo/ui/ui_home.dart';
import 'package:dress_code_picker_demo/data/data_wiki.dart';
import 'package:provider/provider.dart';

class UITips extends StatefulWidget {
  UITips({super.key});
  @override
  State<UITips> createState() {
    return _UITips();
  }
}

class _UITips extends State<UITips> {
  late PageController _pageController;
  late DataWiki _dataWiki;
  var _pageDatas = <Widget>[];
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _dataWiki = DataWiki();
    for (int i = 0; i < _dataWiki.max; i++) {
      _pageDatas.add(Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
                child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppThemeData().colorScheme.tertiary,
              ),
              width: 200,
              height: 200,
              child: SizedBox(
                  width: 100, height: 100, child: Icon(_dataWiki.icons[i])),
            )),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Center(
                        child: Text(
                      _dataWiki.titleData[i],
                      style: AppThemeData().textTheme.titleLarge,
                    ))),
                Expanded(
                  flex: 7,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      _dataWiki.shortDesc[i],
                      style: AppThemeData().textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ));
    }
  }

  @override
  build(context) {
    return Scaffold(
      body: Stack(children: [
        PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            if (index < 0)
              setState(() {
                index = 0;
              });
            return _pageDatas[index % _pageDatas.length];
          },
        ),
        Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Container(
                          width: 0.8 * AppBar().preferredSize.height,
                          height: 0.8 * AppBar().preferredSize.height,
                          decoration: BoxDecoration(
                            color:
                                AppThemeData().colorScheme.secondaryContainer,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              _pageController.previousPage(
                                duration: Durations.short4,
                                curve: Curves.bounceIn,
                              );
                            },
                            icon: Icon(Icons.arrow_left),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: SizedBox(
                          width: AppBar().preferredSize.height,
                          height: AppBar().preferredSize.height,
                          child: FloatingActionButton(
                              child: const Text("OK"),
															onPressed: () => Provider.of<NavigationService>(context, listen: false)
																.replace('home'),
														),
													),
												),
										),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Container(
                          width: 0.8 * AppBar().preferredSize.height,
                          height: 0.8 * AppBar().preferredSize.height,
                          decoration: BoxDecoration(
                            color:
                                AppThemeData().colorScheme.secondaryContainer,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Durations.short4,
                                curve: Curves.bounceIn,
                              );
                            },
                            icon: Icon(Icons.arrow_right),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
