import 'package:flutter/material.dart';

class AppBarHomeScreen extends StatelessWidget implements PreferredSizeWidget {
  final Function() onTap;
  final String text;
  const AppBarHomeScreen({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    const myStyle = TextStyle(
      color: Colors.white70,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    );
    return Container(
      decoration: const BoxDecoration(color: Color(0xFF1C1C1E)),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(text, style: myStyle),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: onTap,
                        child: Icon(
                          Icons.person,
                          color: Colors.white70,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
