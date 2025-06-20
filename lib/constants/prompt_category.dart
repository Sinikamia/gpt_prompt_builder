import 'package:flutter/material.dart';
import 'package:gpt_prompt_builder/features/home/domain/models/prompt_category_models.dart';

List<PromptCategory> promptCategories = <PromptCategory>[
  PromptCategory(category: 'Общие', icon: Icons.menu_book),
  PromptCategory(category: 'Креатив и тексты', icon: Icons.edit_note),
  PromptCategory(category: 'ИИ и технологии', icon: Icons.smart_toy),
  PromptCategory(category: 'Разработка кода', icon: Icons.code),
  PromptCategory(category: 'Обучение и развитие', icon: Icons.school),
  PromptCategory(category: 'Бизнес и карьера', icon: Icons.business_center),
  PromptCategory(category: 'Графика и визуалы', icon: Icons.image),
  PromptCategory(category: 'Культура и переводы', icon: Icons.public),
  PromptCategory(category: 'Развлечения', icon: Icons.videogame_asset),
];
