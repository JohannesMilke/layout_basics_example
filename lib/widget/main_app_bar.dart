import 'package:flutter/material.dart';
import 'items/layout_type.dart';

class AppBarWidget extends AppBar {
  AppBarWidget({
    required LayoutType layoutType,
    required PreferredSize bottom,
  }) : super(
          title: Text(layoutNames[layoutType]!),
          centerTitle: true,
          bottom: bottom,
        );
}
