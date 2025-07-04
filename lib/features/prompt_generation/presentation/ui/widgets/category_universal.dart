import 'package:flutter/material.dart';

class CategoryUniversal extends StatelessWidget {
  final String text;
  final Function() onTap;
  final String textCategory;
  final IconData icon;
  const CategoryUniversal({
    super.key,
    required this.text,
    required this.onTap,
    required this.textCategory,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    const myStyle = TextStyle(
      color: Colors.white70,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Text(text, style: myStyle),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1E),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.white24, width: 1),
              ),
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          textCategory,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Icon(icon, color: Colors.white70),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
