library fancy_bottom_bar;

import 'package:apphibridatrabajos/bottom_bar/fancy_bottom_item.dart';
import 'package:apphibridatrabajos/bottom_bar/fancy_item.dart';
import 'package:flutter/material.dart';

export 'fancy_bottom_bar.dart';
export 'fancy_bottom_item.dart';

const double DEFAULT_BOTTOM_APP_BAR_HEIGHT = 64;
const double DEFAULT_ELEVATION = 8;

class FancyBottomBar extends StatelessWidget {
  final ValueChanged<int> onItemSelected;
  final int selectedPosition;
  final List<FancyBottomItem> items;
  final double height;
  final double elevation;
  final Color bgColor;
  final Color indicatorColor;
  final Color selectedColor;

  FancyBottomBar({
    this.onItemSelected,
    this.selectedPosition,
    this.items,
    this.height,
    this.elevation,
    this.bgColor,
    this.indicatorColor,
    this.selectedColor,
  })  : assert(items.isNotEmpty),
        assert(selectedPosition != null),
        assert(selectedPosition >= 0 && selectedPosition < items.length);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: elevation ?? DEFAULT_ELEVATION,
      color: bgColor ?? Theme.of(context).bottomAppBarColor,
      child: SafeArea(
        child: SizedBox(
          child: Row(
            children: items
                .asMap()
                .map((i, item) => MapEntry(
                    i,
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => onItemSelected(i),
                        child: FancyItem(
                          item: item,
                          selected: i == selectedPosition,
                          indicatorColor: indicatorColor,
                          selectedColor: selectedColor,
                        ),
                      ),
                    )))
                .values
                .toList(),
          ),
          height: height ?? DEFAULT_BOTTOM_APP_BAR_HEIGHT,
        ),
      ),
    );
  }
}
