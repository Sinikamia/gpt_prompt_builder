import 'package:flutter/material.dart';

class ShowDropdownMenu {
  static Future<T?> show<T>({
    required BuildContext context,
    required GlobalKey anchorKey,
    required List<T> items,
    Widget Function(T item)? itemBuilder,
    String Function(T item)? textBuilder,
    double itemHeight = 44,
    double width = 200,
    Color backgroundColor = const Color(0xFF1C1C1E),
    TextStyle myStyle = const TextStyle(
      color: Colors.white70,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  }) async {
    final RenderBox renderBox =
        anchorKey.currentContext!.findRenderObject() as RenderBox;

    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final screenSize = MediaQuery.of(context).size;

    final double menuHeight = items.length * itemHeight;
    final double menuWidth = width.clamp(150.0, 300.0);

    final double top = offset.dy - menuHeight;
    final double left = offset.dx + size.width - menuWidth;
    final double right = screenSize.width - offset.dx - size.width;
    final double bottom = screenSize.height - offset.dy;

    Widget defaultItemBuilder(T item) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white24, width: 0.3)),
        ),
        child: Center(
          child: Text(
            textBuilder != null ? textBuilder(item) : item.toString(),
            textAlign: TextAlign.center,
            style: myStyle,
          ),
        ),
      );
    }

    return showMenu<T>(
      context: context,
      position: RelativeRect.fromLTRB(left, top, right, bottom),
      elevation: 4,
      color: backgroundColor,
      items: [
        PopupMenuItem<T>(
          enabled: false,
          child: SizedBox(
            width: menuWidth,
            height: menuHeight,
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children:
                  items.map((item) {
                    return InkWell(
                      onTap: () => Navigator.pop(context, item),
                      child:
                          itemBuilder?.call(item) ?? defaultItemBuilder(item),
                    );
                  }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
