import 'package:flutter/material.dart';

class AppBarUniversal extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onTap;
  final String text;
  final IconData? icon;
  final bool showBottomLine;
  final Function()? onPressed;
  const AppBarUniversal({
    super.key,
    this.onTap,
    required this.text,
    this.icon,
    this.showBottomLine = false,
    this.onPressed,
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child:
              onPressed != null
                  ? Row(
                    children: [
                      InkWell(
                        onTap: onPressed,
                        child: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(width: 16),
                      icon != null
                          ? Row(
                            children: [
                              Text(text, style: myStyle),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: onTap,
                                    child: Icon(
                                      icon,
                                      color: Colors.white70,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                          : Center(child: Text(text, style: myStyle)),
                    ],
                  )
                  : icon != null
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
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
