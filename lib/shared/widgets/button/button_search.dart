import 'package:flutter/material.dart';

class ButtonSearch extends StatelessWidget {
  final TextEditingController controller;
  const ButtonSearch({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double widthSearch = width - 40;
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: widthSearch,
        height: 45,
        decoration: const BoxDecoration(
          color: Color(0xFF3A3A3C),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            border: InputBorder.none,
            icon: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(Icons.search, color: Colors.white54),
            ),
            hintText: "Быстрый поиск",
            hintStyle: TextStyle(color: Colors.white54, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
