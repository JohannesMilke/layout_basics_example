import 'package:flutter/material.dart';
import '../layout_selector_widget.dart';

class ListGridItems extends StatefulWidget {
  final ValueChanged<int> onChangedLayout;

  final ValueChanged<int> onChangedCount;
  final ValueChanged<int> onChangedScrollDirection;
  final ValueChanged<int> onChangedAspectRatio;

  const ListGridItems({
    required this.onChangedLayout,
    required this.onChangedCount,
    required this.onChangedScrollDirection,
    required this.onChangedAspectRatio,
  });

  @override
  _ListGridItemsState createState() => _ListGridItemsState();
}

class _ListGridItemsState extends State<ListGridItems> {
  bool aspectRatioDisabled = true;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Column(
              children: <Widget>[
                LayoutSelectorWidget(
                  title: 'Layout',
                  values: ['list', 'grid'],
                  onChanged: setLayout,
                ),
                LayoutSelectorWidget(
                  title: 'Scroll Direction',
                  values: ['vertical', 'horizontal'],
                  onChanged: widget.onChangedScrollDirection,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                LayoutSelectorWidget(
                  title: 'CrossAxisCount',
                  disabled: aspectRatioDisabled,
                  values: [
                    '2',
                    '3',
                    '4',
                    '5',
                  ],
                  onChanged: widget.onChangedCount,
                ),
                LayoutSelectorWidget(
                  title: 'AspectRatio',
                  disabled: aspectRatioDisabled,
                  values: ['1/2', '3/4', '1', '5/4', '3/2'],
                  onChanged: widget.onChangedAspectRatio,
                ),
              ],
            ),
          ),
        ],
      );

  void setLayout(int index) {
    widget.onChangedLayout(index);

    setState(() => aspectRatioDisabled = index == 0);
  }
}
