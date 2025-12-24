import 'package:flutter/material.dart';

class ButtonPromptScreen extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onTap;
  const ButtonPromptScreen({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    const myStyle = TextStyle(
      color: Colors.white70,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );
    return Container(
      width: 170,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white12,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white70, size: 20),
              const SizedBox(width: 10),
              Text(text, style: myStyle),
            ],
          ),
        ),
      ),
    );
  }
}
