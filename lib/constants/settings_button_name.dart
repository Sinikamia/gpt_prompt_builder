import 'package:flutter/material.dart';
import 'package:gpt_prompt_builder/features/settings/domain/models/settings_button_models.dart';

List<SettingsButtonName> settingsButtonName = <SettingsButtonName>[
  SettingsButtonName(text: 'Профиль', icon: Icons.account_circle_outlined),
  SettingsButtonName(text: 'Обновить до премиум', icon: Icons.arrow_circle_up),
  SettingsButtonName(text: 'Обратная связь', icon: Icons.attach_email_outlined),
  SettingsButtonName(text: 'Поделиться', icon: Icons.share_outlined),
  SettingsButtonName(
    text: 'Политика конфиденциальности',
    icon: Icons.privacy_tip_outlined,
  ),
];
