import 'package:flutter/material.dart';

class LayoutSelectorWidget extends StatefulWidget {
  final String title;
  final List<String> values;
  final bool disabled;
  final ValueChanged<int> onChanged;

  const LayoutSelectorWidget({
    required this.title,
    required this.values,
    this.disabled = false,
    required this.onChanged,
  });

  @override
  State<StatefulWidget> createState() => LayoutSelectorWidgetState();
}

class LayoutSelectorWidgetState extends State<LayoutSelectorWidget> {
  int index = 0;

  void next() {
    final hasNext = index + 1 < widget.values.length;

    index = hasNext ? index + 1 : 0;
    update();
  }

  void previous() {
    final hasPrevious = index > 0;

    index = hasPrevious ? index - 1 : widget.values.length - 1;
    update();
  }

  void update() => setState(() => widget.onChanged(index));

  @override
  Widget build(BuildContext context) {
    final color = widget.disabled ? Colors.white54 : Colors.white;

    return Column(
      children: [
        Divider(color: Colors.white),
        Text(
          widget.title,
          style: TextStyle(color: color),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back, color: color),
              onPressed: widget.disabled ? null : previous,
            ),
            Text(
              widget.values[index],
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward, color: color),
              onPressed: widget.disabled ? null : next,
            ),
          ],
        ),
      ],
    );
  }
}
