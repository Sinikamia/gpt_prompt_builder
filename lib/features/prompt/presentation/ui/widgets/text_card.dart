import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  final String? name;
  final String text;
  const TextCard({super.key, this.name, required this.text});

  @override
  Widget build(BuildContext context) {
    const myStyle = TextStyle(
      color: Colors.white70,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
    const myStyle1 = TextStyle(
      color: Colors.white54,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
    return name != null
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name ?? '', style: myStyle, textAlign: TextAlign.start),
            SizedBox(height: 10),
            Container(
              width: double.infinity,

              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1E),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.white24, width: 1),
              ),
              child: Text(text, style: myStyle1),
            ),
          ],
        )
        : Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1E),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.white24, width: 1),
          ),
          child: Text(text, style: myStyle1),
        );
  }
}
