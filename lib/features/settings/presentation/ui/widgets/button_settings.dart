import 'package:flutter/material.dart';

class ButtonSettings extends StatelessWidget {
  final Function() onTap;
  final String text;
  final IconData icon;
  const ButtonSettings({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    const myStyle = TextStyle(
      color: Colors.white70,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                children: [
                  Icon(icon, color: Colors.white70, size: 20),
                  const SizedBox(width: 15),
                  Text(text, style: myStyle),
                ],
              ),
            ),
          ),
          Container(height: 0.3, width: width, color: Colors.white24),
        ],
      ),
    );
  }
}
