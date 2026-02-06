import 'package:flutter/material.dart';
import 'package:gpt_prompt_builder/features/settings/domain/models/settings_button_models.dart';

List<SettingsButtonName> settingsButtonName = <SettingsButtonName>[
  SettingsButtonName(
    text: 'Профиль',
    icon: Icons.account_circle_outlined,
    type: SettingsType.profile,
  ),
  SettingsButtonName(
    text: 'Обновить до премиум',
    icon: Icons.arrow_circle_up,
    type: SettingsType.upgrade,
  ),
  SettingsButtonName(
    text: 'Обратная связь',
    icon: Icons.attach_email_outlined,
    type: SettingsType.feedback,
  ),
  SettingsButtonName(
    text: 'Поделиться',
    icon: Icons.share_outlined,
    type: SettingsType.share,
  ),
  SettingsButtonName(
    text: 'Политика конфиденциальности',
    icon: Icons.privacy_tip_outlined,
    type: SettingsType.privacy,
  ),
];
