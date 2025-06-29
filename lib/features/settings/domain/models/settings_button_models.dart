import 'package:flutter/material.dart';

class SettingsButtonName {
  final IconData icon;
  final String text;

  SettingsButtonName({required this.icon, required this.text});

  Map<String, dynamic> toJson() {
    return {'text': text, 'icon': icon};
  }
}
