import 'package:flutter/material.dart';
import 'package:gpt_prompt_builder/constants/settings_button_name.dart';
import 'package:gpt_prompt_builder/features/settings/presentation/ui/widgets/button_settings.dart';
import 'package:gpt_prompt_builder/shared/widgets/app_bar/app_bar_universal.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBarUniversal(text: 'Настройки', showBottomLine: true),
      body: ListView.builder(
        itemCount: settingsButtonName.length,
        itemBuilder: (context, index) {
          return ButtonSettings(
            text: settingsButtonName[index].text,
            icon: settingsButtonName[index].icon,
            onTap: () {},
          );
        },
      ),
    );
  }
}
