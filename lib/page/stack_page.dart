import 'package:flutter/material.dart';
import '../widget/items/layout_type.dart';
import '../widget/main_app_bar.dart';
import '../widget/items/stack_items.dart';

class StackPage extends StatefulWidget {
  StackPage({
    Key? key,
  }) : super(key: key);

  @override
  _StackPageState createState() => new _StackPageState();
}

class _StackPageState extends State<StackPage> {
  double? left = 0;
  double? right;
  double? top = 0;
  double? bottom;
  bool stretch = false;
  double padding = -20;
  bool _useAlignment = true;
  Clip clipBehaviour = Clip.antiAlias;
  AlignmentDirectional _alignmentDirectional = AlignmentDirectional.topStart;

  double getPaddingFromIndex(int index) {
    switch (index) {
      case 0:
        return -20;
      case 1:
        return -10;

      case 2:
        return 0;

      case 3:
        return 10;
      case 4:
        return 20;
      case 5:
        return 30;
    }
    return -20;
  }

  Clip clipFromIndex(int index) {
    switch (index) {
      case 0:
        return Clip.antiAlias;
      case 1:
        return Clip.antiAliasWithSaveLayer;
      case 2:
        return Clip.hardEdge;
      case 3:
        return Clip.none;
    }
    return Clip.antiAlias;
  }

  void setClipBehaviour(int index) =>
      setState(() => clipBehaviour = clipFromIndex(index));

  AlignmentDirectional alignmentFromIndex(int index) {
    switch (index) {
      case 0:
        return AlignmentDirectional.topStart;
      case 1:
        return AlignmentDirectional.topCenter;
      case 2:
        return AlignmentDirectional.topEnd;
      case 3:
        return AlignmentDirectional.centerStart;
      case 4:
        return AlignmentDirectional.center;
      case 5:
        return AlignmentDirectional.centerEnd;
      case 6:
        return AlignmentDirectional.bottomStart;
      case 7:
        return AlignmentDirectional.bottomCenter;
      case 8:
        return AlignmentDirectional.bottomEnd;
    }
    return AlignmentDirectional.center;
  }

  void setPadding(int index) =>
      setState(() => padding = getPaddingFromIndex(index));

  void setAlignment(int index) {
    stretch = false;
    if (_useAlignment)
      setState(() => _alignmentDirectional = alignmentFromIndex(index));
    else {
      switch (index) {
        case 0:
          setState(() {
            top = null;
            left = null;
            right = null;
            bottom = null;
          });
          return;
        case 1:
          setState(() {
            top = 0;
            left = 0;
            right = null;
            bottom = null;
          });
          return;
        case 2:
          setState(() {
            top = 0;
            left = 0;
            right = 0;
            bottom = null;
          });
          return;
        case 3:
          setState(() {
            top = 0;
            left = null;
            right = 0;
            bottom = null;
          });
          return;
        case 4:
          setState(() {
            top = 0;
            left = 0;
            right = 0;
            bottom = null;
            stretch = true;
          });
          return;
        case 5:
          setState(() {
            top = null;
            left = 0;
            right = null;
            bottom = 0;
          });
          return;
        case 6:
          setState(() {
            top = null;
            left = 0;
            right = 0;
            bottom = 0;
          });
          return;
        case 7:
          setState(() {
            top = null;
            left = null;
            right = 0;
            bottom = 0;
          });
          return;
        case 8:
          setState(() {
            top = null;
            left = 0;
            right = 0;
            bottom = 0;
            stretch = true;
          });
          return;
      }

      setState(() {
        top = null;
        left = null;
        right = null;
        bottom = null;
      });
      return;
    }
  }

  void setType(int index) => setState(() => _useAlignment = index == 0);

  Widget _buildStack() {
    if (_useAlignment) {
      return Stack(
        clipBehavior: clipBehaviour,
        alignment: _alignmentDirectional,
        children: <Widget>[
          Container(color: Colors.green, width: 300, height: 300),
          Container(color: Colors.yellow, width: 200, height: 200),
          Container(color: Colors.red, width: 100, height: 100),
        ],
      );
    } else {
      final isNotCentered = (left ?? right ?? top ?? bottom) == null || stretch;

      return Stack(
        clipBehavior: clipBehaviour,
        alignment: _alignmentDirectional,
        children: <Widget>[
          Container(color: Colors.yellow, width: 300, height: 300),
          Positioned(
            left: left == null ? null : left! + padding,
            top: top == null ? null : top! + padding,
            right: right == null ? null : right! + padding,
            bottom: bottom == null ? null : bottom! + padding,
            child: isNotCentered
                ? Container(height: 100, width: 100, color: Colors.indigo)
                : Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.indigo,
                    ),
                  ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarWidget(
          layoutType: LayoutType.stack,
          bottom: PreferredSize(
            preferredSize: Size(0.0, 160.0),
            child: buildBottom(),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: _buildStack(),
          ),
        ),
      );

  Widget buildBottom() => StackItems(
        onChangedType: setType,
        onChangedAlignment: setAlignment,
        onChangedClipBehaviour: setClipBehaviour,
        onChangedMargin: setPadding,
      );
}
