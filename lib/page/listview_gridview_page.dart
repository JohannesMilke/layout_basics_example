import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:layout_basics_example/widget/items/list_grid_items.dart';

import '../widget/items/layout_type.dart';
import '../widget/main_app_bar.dart';

class ListViewGridViewPage extends StatefulWidget {
  @override
  _ListViewGridViewPageState createState() => new _ListViewGridViewPageState();
}

class _ListViewGridViewPageState extends State<ListViewGridViewPage> {
  bool isList = true;
  Axis scrollDirection = Axis.vertical;
  int count = 2;
  double aspectRatio = 0.5;

  void setLayout(int index) => setState(() => isList = index == 0);

  double aspectRatioFromIndex(int index) {
    switch (index) {
      case 0:
        return 0.5;
      case 1:
        return 0.75;
      case 2:
        return 1;
      case 3:
        return 1.25;
      case 4:
        return 1.5;
      default:
        return 0.5;
    }
  }

  void setAspectRatio(int index) =>
      setState(() => aspectRatio = aspectRatioFromIndex(index));

  Axis getAxis(int index) {
    switch (index) {
      case 0:
        return Axis.vertical;
      case 1:
      default:
        return Axis.horizontal;
    }
  }

  void setScrollAxis(int index) =>
      setState(() => scrollDirection = getAxis(index));

  int _countFromIndex(int index) {
    if (index < 4 && index >= 0) return index + 2;

    return 2;
  }

  void setCount(int index) => setState(() => count = _countFromIndex(index));

  Widget buildContent() {
    if (isList) {
      return ListView.builder(
        scrollDirection: scrollDirection,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: scrollDirection == Axis.vertical ? 300 : double.infinity,
            width: scrollDirection == Axis.vertical ? double.infinity : 300,
            child: Image.network(
              'https://source.unsplash.com/random?sig=$index',
              fit: BoxFit.cover,
            ),
          ),
        ),
        itemCount: 10,
      );
    } else {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: count,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: aspectRatio,
        ),
        itemBuilder: (context, index) => SizedBox(
          child: Image.network(
            'https://source.unsplash.com/random?sig=$index',
            fit: BoxFit.cover,
          ),
        ),
        itemCount: 20,
        scrollDirection: scrollDirection,
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarWidget(
          layoutType: LayoutType.list,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(160),
            child: buildBottom(),
          ),
        ),
        body: Container(color: Colors.yellow, child: buildContent()),
      );

  Widget buildBottom() => ListGridItems(
        onChangedLayout: setLayout,
        onChangedScrollDirection: setScrollAxis,
        onChangedCount: setCount,
        onChangedAspectRatio: setAspectRatio,
      );
}
