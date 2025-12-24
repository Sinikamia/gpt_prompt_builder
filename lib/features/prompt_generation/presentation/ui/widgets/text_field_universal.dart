import 'package:flutter/material.dart';

class TextFieldUniversal extends StatelessWidget {
  final IconData icon;
  final String text;
  final String hintText;
  final TextEditingController? controller;
  TextFieldUniversal({
    super.key,
    required this.icon,
    required this.text,
    required this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    const myStyle = TextStyle(
      color: Colors.white70,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0), // padding(.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white70),
              const SizedBox(width: 10),
              Text(text, style: myStyle),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF1C1C1E),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.white24, width: 1),
            ),
            child: TextField(
              controller: controller,
              maxLines: null,
              minLines: 1,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.white54,
                  fontSize: 16,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
