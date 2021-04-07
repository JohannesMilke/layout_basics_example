import 'package:flutter/material.dart';
import '../layout_selector_widget.dart';

class ExpandedItems extends StatefulWidget {
  final ValueChanged<int> onChangedExample;
  final ValueChanged<int> onChangedFlex1;
  final ValueChanged<int> onChangedFlex2;
  final ValueChanged<int> onChangedFlex3;

  const ExpandedItems({
    required this.onChangedExample,
    required this.onChangedFlex1,
    required this.onChangedFlex2,
    required this.onChangedFlex3,
  });

  @override
  _ExpandedItemsState createState() => _ExpandedItemsState();
}

class _ExpandedItemsState extends State<ExpandedItems> {
  bool isExample1 = true;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Column(
              children: <Widget>[
                LayoutSelectorWidget(
                  title: 'Layout',
                  values: ['Example1', 'Example2'],
                  onChanged: setExample,
                ),
                LayoutSelectorWidget(
                  title: 'Red',
                  values: ['1', '2', '3', '4'],
                  onChanged: widget.onChangedFlex1,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                LayoutSelectorWidget(
                  title: 'Blue',
                  values: ['1', '2', '3', '4'],
                  onChanged: widget.onChangedFlex2,
                ),
                LayoutSelectorWidget(
                  title: 'Green',
                  values: ['1', '2', '3', '4'],
                  onChanged: widget.onChangedFlex3,
                ),
              ],
            ),
          ),
        ],
      );

  void setExample(int index) {
    widget.onChangedExample(index);

    setState(() => isExample1 = index == 0);
  }
}
