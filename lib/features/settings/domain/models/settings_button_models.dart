import 'package:flutter/material.dart';

enum SettingsType { profile, upgrade, feedback, share, privacy }

class SettingsButtonName {
  final IconData icon;
  final String text;
  final SettingsType type;

  SettingsButtonName({
    required this.icon,
    required this.text,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {'text': text, 'icon': icon, 'type': type};
  }
}
