import 'package:flutter/material.dart';
import '../layout_selector_widget.dart';

class ContainerItems extends StatelessWidget {
  final ValueChanged<int> onChangedPadding;
  final ValueChanged<int> onChangedMargin;

  const ContainerItems({
    required this.onChangedPadding,
    required this.onChangedMargin,
  });

  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: LayoutSelectorWidget(
              title: 'Padding',
              values: ['0', '10px', '20px', '30px'],
              onChanged: onChangedPadding,
            ),
          ),
          Expanded(
            child: LayoutSelectorWidget(
              title: 'Margin',
              values: ['0', '10px', '20px', '30px'],
              onChanged: onChangedMargin,
            ),
          ),
        ],
      );
}
