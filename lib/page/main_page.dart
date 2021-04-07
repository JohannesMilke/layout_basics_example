import 'package:flutter/material.dart';
import 'package:layout_basics_example/page/container_page.dart';
import 'package:layout_basics_example/page/listview_gridview_page.dart';

import '../widget/items/layout_type.dart';
import 'expanded_page.dart';
import 'row_column_page.dart';
import 'stack_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  LayoutType selectedLayout = LayoutType.rowColumn;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: buildBody(),
        bottomNavigationBar: buildBottomNavigationBar(),
      );

  Widget buildBody() => <LayoutType, WidgetBuilder>{
        LayoutType.rowColumn: (_) => RowColumnPage(),
        LayoutType.stack: (_) => StackPage(),
        LayoutType.expanded: (_) => ExpandedPage(),
        LayoutType.container: (_) => ContainerPage(),
        LayoutType.list: (_) => ListViewGridViewPage(),
      }[selectedLayout]!(context);

  Widget buildBottomNavigationBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedLayout.index,
        items: [
          buildItem(
            icon: Icons.view_headline,
            layout: LayoutType.rowColumn,
          ),
          buildItem(
            icon: Icons.layers,
            layout: LayoutType.stack,
          ),
          buildItem(
            icon: Icons.line_weight,
            layout: LayoutType.expanded,
          ),
          buildItem(
            icon: Icons.format_line_spacing,
            layout: LayoutType.container,
          ),
          buildItem(
            icon: Icons.list,
            layout: LayoutType.list,
          ),
        ],
        onTap: setTab,
      );

  BottomNavigationBarItem buildItem({
    required IconData icon,
    required LayoutType layout,
  }) {
    final text = layoutNames[layout]!;

    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: text,
    );
  }

  void setLayout(LayoutType layout) => setState(() => selectedLayout = layout);

  void setTab(int index) => setLayout(LayoutType.values[index]);
}
