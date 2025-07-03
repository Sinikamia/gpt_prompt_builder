import 'package:flutter/material.dart';

class ButtonCategoryPrompts extends StatelessWidget {
  final String text;
  final void Function(String) onTap;
  final IconData icon;
  const ButtonCategoryPrompts({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    const myStyle = TextStyle(
      color: Colors.white70,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
    double width = MediaQuery.of(context).size.width;
    double widthButton = (width - 60) / 2;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: widthButton,
        height: 85,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
          onTap: () => onTap(text),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white24, width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5,
              ),
              child: Row(
                children: [
                  Icon(icon, color: Colors.white70),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(text, style: myStyle),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
