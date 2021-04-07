enum LayoutType {
  rowColumn,
  stack,
  expanded,
  container,
  list,
}

Map<LayoutType, String> layoutNames = {
  LayoutType.rowColumn: 'Row / Col',
  LayoutType.stack: 'Stack',
  LayoutType.expanded: 'Expanded',
  LayoutType.container: 'Container',
  LayoutType.list: 'List / Grid',
};
