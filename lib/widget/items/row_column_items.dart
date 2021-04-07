import 'package:flutter/material.dart';

import '../layout_selector_widget.dart';

class RowColumnItems extends StatefulWidget {
  final ValueChanged<int> onChangedLayout;
  final ValueChanged<int> onChangedMainAxisAlignment;
  final ValueChanged<int> onChangedCrossAxisAlignment;
  final ValueChanged<int> onChangedMainAxisSize;

  const RowColumnItems({
    required this.onChangedLayout,
    required this.onChangedMainAxisAlignment,
    required this.onChangedCrossAxisAlignment,
    required this.onChangedMainAxisSize,
  });

  @override
  _RowColumnItemsState createState() => _RowColumnItemsState();
}

class _RowColumnItemsState extends State<RowColumnItems> {
  bool showMainAxisAlign = false;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Column(
              children: <Widget>[
                LayoutSelectorWidget(
                  title: 'Layout',
                  values: ['row', 'column'],
                  onChanged: widget.onChangedLayout,
                ),
                LayoutSelectorWidget(
                  title: 'Main Axis Size',
                  values: ['min', 'max'],
                  onChanged: setMainAxisSize,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                LayoutSelectorWidget(
                  title: 'Main Axis Alignment',
                  values: [
                    'start',
                    'end',
                    'center',
                    'space\nbetween',
                    'space\naround',
                    'space\nevenly'
                  ],
                  disabled: !showMainAxisAlign,
                  onChanged: widget.onChangedMainAxisAlignment,
                ),
                LayoutSelectorWidget(
                  title: 'Cross Axis Alignment',
                  values: [
                    'start',
                    'end',
                    'center',
                    'stretch',
                  ],
                  onChanged: widget.onChangedCrossAxisAlignment,
                ),
              ],
            ),
          ),
        ],
      );

  void setMainAxisSize(int index) {
    widget.onChangedMainAxisSize(index);

    setState(() => showMainAxisAlign = index == 1);
  }
}
