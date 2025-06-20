import 'package:flutter/material.dart';

class PromptCategory {
  final String category;
  final IconData icon;

  PromptCategory({required this.category, required this.icon});

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'icon': icon, // или type.toString().split('.').last
    };
  }
}
