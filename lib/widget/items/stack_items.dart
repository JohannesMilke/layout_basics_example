import 'package:flutter/material.dart';
import '../layout_selector_widget.dart';

class StackItems extends StatefulWidget {
  final ValueChanged<int> onChangedType;
  final ValueChanged<int> onChangedAlignment;
  final ValueChanged<int> onChangedMargin;
  final ValueChanged<int> onChangedClipBehaviour;

  const StackItems({
    required this.onChangedType,
    required this.onChangedAlignment,
    required this.onChangedMargin,
    required this.onChangedClipBehaviour,
  });

  @override
  State<StatefulWidget> createState() => StackItemsState();
}

class StackItemsState extends State<StackItems> {
  bool alignmentDisabled = false;
  bool marginDisabled = false;

  void setAlignment(int index) {
    widget.onChangedAlignment(index);
    if (!alignmentDisabled) return;

    setState(() => marginDisabled = index == 0);
  }

  void setType(int index) {
    widget.onChangedType(index);

    setState(() => alignmentDisabled = index == 1);
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: LayoutSelectorWidget(
                  title: 'Type',
                  values: [
                    'align',
                    'position',
                  ],
                  onChanged: setType,
                ),
              ),
              Expanded(
                child: LayoutSelectorWidget(
                  title: !alignmentDisabled ? 'Alignment' : 'Position From',
                  values: !alignmentDisabled
                      ? [
                          'top\nstart',
                          'top\ncenter',
                          'top\nend',
                          'center\nstart',
                          'center',
                          'center\nend',
                          'bottom\nstart',
                          'bottom\ncenter',
                          'bottom\nend',
                        ]
                      : [
                          'none',
                          'top\nleft',
                          'top\ncenter',
                          'top\nright',
                          'top\nstretch',
                          'bottom\nleft',
                          'bottom\ncenter',
                          'bottom\nright',
                          'bottom\nstretch',
                        ],
                  onChanged: setAlignment,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: LayoutSelectorWidget(
                  title: 'Margin',
                  values: [
                    '-20px',
                    '-10px',
                    '0',
                    '10px',
                    '20px',
                    '30px',
                  ],
                  disabled: !alignmentDisabled || marginDisabled,
                  onChanged: widget.onChangedMargin,
                ),
              ),
              Expanded(
                child: LayoutSelectorWidget(
                  title: 'ClipBehaviour',
                  values: [
                    'antiAlias',
                    'antiAlias\nSaveLayer',
                    'hardEdge',
                    'none',
                  ],
                  disabled: !alignmentDisabled,
                  onChanged: widget.onChangedClipBehaviour,
                ),
              ),
            ],
          ),
        ],
      );
}
