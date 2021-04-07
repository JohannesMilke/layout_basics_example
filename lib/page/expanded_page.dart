import 'package:flutter/material.dart';
import 'package:layout_basics_example/widget/items/expanded_items.dart';
import 'package:layout_basics_example/widget/items/layout_type.dart';

import '../widget/main_app_bar.dart';

class ExpandedPage extends StatefulWidget {
  @override
  _ExpandedPageState createState() => new _ExpandedPageState();
}

class _ExpandedPageState extends State<ExpandedPage> {
  bool isExample1 = true;
  int flex1 = 1;
  int flex2 = 1;
  int flex3 = 1;

  void setLayout(int index) => setState(() => isExample1 = index == 0);

  int _flexFromIndex(int index) {
    if (index < 4 && index >= 0) {
      return index + 1;
    }
    return 1;
  }

  void setFlex1(int index) => setState(() => flex1 = _flexFromIndex(index));

  void setFlex2(int index) => setState(() => flex2 = _flexFromIndex(index));

  void setFlex3(int index) => setState(() => flex3 = _flexFromIndex(index));

  Widget buildBox({
    required int flex,
    required Color color,
    Color textColor = Colors.white,
  }) =>
      Expanded(
        flex: flex,
        child: Container(
          constraints: BoxConstraints.expand(),
          color: color,
          child: Center(
            child: Text(
              'Flex:$flex',
              style: TextStyle(fontSize: 32.0, color: textColor),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarWidget(
          layoutType: LayoutType.expanded,
          bottom: PreferredSize(
            preferredSize: Size(0.0, 160.0),
            child: buildBottom(),
          ),
        ),
        body: Container(color: Colors.yellow, child: buildContent()),
      );

  Widget buildContent() {
    if (isExample1) {
      return Row(
        children: [
          buildBox(flex: flex1, color: Colors.red),
          Expanded(
            flex: flex2,
            child: Column(
              children: [
                buildBox(flex: flex2, color: Colors.blue),
                buildBox(flex: flex3, color: Colors.green),
              ],
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          buildBox(flex: flex1, color: Colors.red),
          Expanded(
            flex: flex2,
            child: Row(
              children: [
                buildBox(flex: flex2, color: Colors.blue),
                buildBox(flex: flex3, color: Colors.green),
              ],
            ),
          ),
        ],
      );
    }
  }

  Widget buildBottom() => ExpandedItems(
        onChangedExample: setLayout,
        onChangedFlex1: setFlex1,
        onChangedFlex2: setFlex2,
        onChangedFlex3: setFlex3,
      );
}
