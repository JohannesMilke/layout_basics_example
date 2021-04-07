import 'package:flutter/material.dart';
import 'package:layout_basics_example/widget/items/layout_type.dart';
import 'package:layout_basics_example/widget/items/row_column_items.dart';

import '../widget/main_app_bar.dart';

class RowColumnPage extends StatefulWidget {
  @override
  _RowColumnPageState createState() => new _RowColumnPageState();
}

class _RowColumnPageState extends State<RowColumnPage> {
  bool isRow = true;
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;
  MainAxisSize mainAxisSize = MainAxisSize.min;

  void setLayout(int index) => setState(() => isRow = index == 0);

  MainAxisAlignment getMainAxisAlignment(int index) {
    switch (index) {
      case 0:
        return MainAxisAlignment.start;
      case 1:
        return MainAxisAlignment.end;
      case 2:
        return MainAxisAlignment.center;
      case 3:
        return MainAxisAlignment.spaceBetween;
      case 4:
        return MainAxisAlignment.spaceAround;
      case 5:
        return MainAxisAlignment.spaceEvenly;
    }
    return MainAxisAlignment.start;
  }

  void setMainAxisAlignment(int index) =>
      setState(() => mainAxisAlignment = getMainAxisAlignment(index));

  CrossAxisAlignment getCrossAxisAlignment(int index) {
    switch (index) {
      case 0:
        return CrossAxisAlignment.start;
      case 1:
        return CrossAxisAlignment.end;
      case 2:
        return CrossAxisAlignment.center;
      case 3:
        return CrossAxisAlignment.stretch;
      case 4:
        return CrossAxisAlignment.baseline;
    }
    return CrossAxisAlignment.start;
  }

  void setCrossAxisAlignment(int index) =>
      setState(() => crossAxisAlignment = getCrossAxisAlignment(index));

  void setMainAxisSize(int index) => setState(
      () => mainAxisSize = index == 0 ? MainAxisSize.min : MainAxisSize.max);

  Widget buildContent() {
    final children = [
      FlutterLogo(size: 50),
      FlutterLogo(size: 100),
      FlutterLogo(size: 50),
    ];

    if (isRow) {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: children,
      );
    } else {
      return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: children,
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarWidget(
          layoutType: LayoutType.rowColumn,
          bottom: PreferredSize(
            preferredSize: Size(0.0, 160.0),
            child: buildBottom(),
          ),
        ),
        body: Container(color: Colors.yellow, child: buildContent()),
      );

  Widget buildBottom() => RowColumnItems(
        onChangedLayout: setLayout,
        onChangedMainAxisAlignment: setMainAxisAlignment,
        onChangedCrossAxisAlignment: setCrossAxisAlignment,
        onChangedMainAxisSize: setMainAxisSize,
      );
}
