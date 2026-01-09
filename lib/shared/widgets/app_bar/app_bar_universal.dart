import 'package:flutter/material.dart';

class AppBarUniversal extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onTap;
  final String? text;
  final IconData? icon;
  final bool showBottomLine;
  final VoidCallback? onPressed;

  const AppBarUniversal({
    super.key,
    this.onTap,
    this.text,
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
        color: Colors.transparent,
        border:
            showBottomLine
                ? const Border(
                  bottom: BorderSide(color: Colors.white24, width: 0.3),
                )
                : null,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
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
                      if (icon != null) ...[
                        if (text != null) Text(text!, style: myStyle),
                        const Spacer(),
                        InkWell(
                          onTap: onTap,
                          child: Icon(icon, color: Colors.white70, size: 30),
                        ),
                      ] else if (text != null)
                        Expanded(
                          child: Center(
                            child: Text(
                              text!,
                              textAlign: TextAlign.center,
                              style: myStyle,
                            ),
                          ),
                        ),
                    ],
                  )
                  : icon != null
                  ? Row(
                    children: [
                      if (text != null) Text(text!, style: myStyle),
                      const Spacer(),
                      InkWell(
                        onTap: onTap,
                        child: Icon(icon, color: Colors.white70, size: 30),
                      ),
                    ],
                  )
                  : text != null
                  ? Center(
                    child: Text(
                      text!,
                      textAlign: TextAlign.center,
                      style: myStyle,
                    ),
                  )
                  : const SizedBox.shrink(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
