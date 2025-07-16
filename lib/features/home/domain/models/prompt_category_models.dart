import 'package:flutter/material.dart';

class PromptCategory {
  final String category;
  final IconData? icon;
  final List<PromptSubCategory> subCategories;

  PromptCategory({
    required this.category,
    this.icon,
    required this.subCategories,
  });

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'icon': icon?.codePoint,
      'subCategories': subCategories.map((e) => e.toJson()).toList(),
    };
  }

  factory PromptCategory.fromJson(Map<String, dynamic> json) {
    return PromptCategory(
      category: json['category'],
      icon:
          json['icon'] != null
              ? IconData(json['icon'], fontFamily: 'MaterialIcons')
              : null,
      subCategories:
          (json['subCategories'] as List)
              .map((e) => PromptSubCategory.fromJson(e))
              .toList(),
    );
  }
}

class PromptSubCategory {
  final String subCategories;

  PromptSubCategory({required this.subCategories});

  Map<String, dynamic> toJson() {
    return {'subCategories': subCategories};
  }

  factory PromptSubCategory.fromJson(Map<String, dynamic> json) {
    return PromptSubCategory(subCategories: json['subCategories']);
  }
}
