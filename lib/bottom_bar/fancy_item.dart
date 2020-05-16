import 'package:apphibridatrabajos/bottom_bar/fancy_bottom_item.dart';
import 'package:apphibridatrabajos/bottom_bar/tap_ring.dart';
import 'package:flutter/material.dart';

const Duration ANIM_DURATION = const Duration(milliseconds: 400);
const double ANIM_Y_OFFSET = -200;
const double SELECTION_INDICATOR_SIZE = 4;

class FancyItem extends StatefulWidget {
  final FancyBottomItem item;
  final bool selected;
  final Color indicatorColor;
  final Color selectedColor;

  FancyItem({
    this.item,
    this.selected,
    this.indicatorColor,
    this.selectedColor,
  });

  @override
  _FancyItemState createState() => _FancyItemState();
}

class _FancyItemState extends State<FancyItem> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final selectedIndicator = Container(
      width: SELECTION_INDICATOR_SIZE,
      height: SELECTION_INDICATOR_SIZE,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.indicatorColor ?? Colors.black,
      ),
    );
    final title = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Spacer(flex: 4),
        widget.item.title,
        Spacer(flex: 2),
        selectedIndicator,
        Spacer(flex: 1),
      ],
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          overflow: Overflow.clip,
          alignment: Alignment.center,
          children: <Widget>[
            AnimatedPositioned(
              child: title,
              duration: ANIM_DURATION,
              top: 0,
              bottom: widget.selected ? 0 : ANIM_Y_OFFSET,
            ),
            AnimatedPositioned(
              child: widget.item.icon,
              duration: ANIM_DURATION,
              top: widget.selected ? ANIM_Y_OFFSET : 0,
              bottom: 0,
            ),
            Positioned.fill(
              child: Center(
                child: TapRing(
                  isSelected: widget.selected,
                  color: widget.selectedColor ?? Theme.of(context).accentColor,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
