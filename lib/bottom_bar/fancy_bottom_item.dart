import 'package:flutter/widgets.dart';

class FancyBottomItem {
  final Widget title;
  final Widget icon;
  final Widget content;

  const FancyBottomItem({this.title, this.icon, this.content})
      : assert(title != null),
        assert(content != null),
        assert(icon != null);
}
