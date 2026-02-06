import 'package:flutter/material.dart';
import 'package:gpt_prompt_builder/constants/settings_button_name.dart';
import 'package:gpt_prompt_builder/features/account/presentation/ui/account_screen.dart';
import 'package:gpt_prompt_builder/features/settings/domain/models/settings_button_models.dart';
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
            onTap: () {
              switch (settingsButtonName[index].type) {
                case SettingsType.profile:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountScreen()),
                  );
                  break;

                case SettingsType.upgrade:
                  break;

                case SettingsType.feedback:
                  break;

                case SettingsType.share:
                  break;

                case SettingsType.privacy:
                  break;
              }
            },
          );
        },
      ),
    );
  }
}
