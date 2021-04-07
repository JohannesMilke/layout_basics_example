import 'package:flutter/material.dart';
import 'package:layout_basics_example/widget/items/container_items.dart';

import '../widget/items/layout_type.dart';
import '../widget/main_app_bar.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => new _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  EdgeInsets padding = EdgeInsets.zero;
  EdgeInsets margin = EdgeInsets.zero;

  EdgeInsets marginPaddingFromIndex(int index) {
    switch (index) {
      case 0:
        return EdgeInsets.zero;
      case 1:
        return EdgeInsets.all(10);
      case 2:
        return EdgeInsets.all(20);
      case 3:
        return EdgeInsets.all(30);
      default:
        return EdgeInsets.zero;
    }
  }

  void setMargin(int index) =>
      setState(() => margin = marginPaddingFromIndex(index));

  void setPadding(int index) =>
      setState(() => padding = marginPaddingFromIndex(index));

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarWidget(
          layoutType: LayoutType.container,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: buildBottom(),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildBox('1. Widget'),
              buildContent(),
              buildBox('3. Widget'),
            ],
          ),
        ),
      );

  Widget buildBox(String text) => Container(
        height: 50,
        color: Colors.orange,
        child: Center(child: Text(text, style: TextStyle(fontSize: 16))),
      );

  Widget buildContent() => Container(
        color: Colors.blue,
        padding: padding,
        margin: margin,
        child: Container(
            color: Colors.yellow,
            child: Text(
              '2. Widget',
              style: TextStyle(fontSize: 32),
            )),
      );
  Widget buildBottom() => ContainerItems(
        onChangedMargin: setMargin,
        onChangedPadding: setPadding,
      );
}
