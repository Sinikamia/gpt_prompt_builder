import 'package:flutter/material.dart';

class AppBarUniversal extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onTap;
  final String text;
  final IconData? icon;
  final bool showBottomLine;
  const AppBarUniversal({
    super.key,
    this.onTap,
    required this.text,
    this.icon,
    this.showBottomLine = false,
  });

  @override
  Widget build(BuildContext context) {
    const myStyle = TextStyle(
      color: Colors.white70,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    );
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1C1C1E),
        border:
            showBottomLine
                ? Border(bottom: BorderSide(color: Colors.white24, width: 0.3))
                : null,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              icon != null
                  ? Row(
                    children: [
                      Text(text, style: myStyle),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: onTap,
                            child: Icon(icon, color: Colors.white70, size: 30),
                          ),
                        ),
                      ),
                    ],
                  )
                  : Center(child: Text(text, style: myStyle)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
