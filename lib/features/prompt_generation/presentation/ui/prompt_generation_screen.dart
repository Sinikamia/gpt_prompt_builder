import 'package:flutter/material.dart';
import 'package:gpt_prompt_builder/features/prompt_generation/presentation/ui/widgets/button_prompt_generation.dart';
import 'package:gpt_prompt_builder/features/prompt_generation/presentation/ui/widgets/category_universal.dart';
import 'package:gpt_prompt_builder/features/prompt_generation/presentation/ui/widgets/text_field_universal.dart';
import 'package:gpt_prompt_builder/shared/widgets/app_bar/app_bar_universal.dart';

class PromptGenerationScreen extends StatefulWidget {
  final String selectedCategory;
  const PromptGenerationScreen({super.key, required this.selectedCategory});

  @override
  State<PromptGenerationScreen> createState() => _PromptGenerationScreenState();
}

class _PromptGenerationScreenState extends State<PromptGenerationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBarUniversal(
        text: 'Создание промпта',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            TextFieldUniversal(
              text: 'Шаблон промпта',
              icon: Icons.description_outlined,
              hintText:
                  'Пример: Я хочу, чтобы ты выступал как автор писем. Твоя задача — написать письмо на основе того, что я предоставлю, чтобы чётко выразить мои мысли. Мой первый запрос: [Подсказка к промпту]',
            ),
            TextFieldUniversal(
              text: 'Описание',
              icon: Icons.edit_note,
              hintText: 'Пример: Сделай письмо более профессиональным',
            ),
            TextFieldUniversal(
              text: 'Подсказка к промпту',
              icon: Icons.tips_and_updates_outlined,
              hintText: 'Пример: Тема вашего письма',
            ),
            TextFieldUniversal(
              text: 'Название промпта',
              icon: Icons.drive_file_rename_outline,
              hintText: 'Пример: Лучший шаблон письма',
            ),
            SizedBox(height: 20),
            CategoryUniversal(
              text: 'Категория',
              textCategory: 'Категория',
              onTap: () {},
            ),
            CategoryUniversal(
              text: 'Подкатегория',
              textCategory: 'Подкатегория',
              onTap: () {},
            ),
            SizedBox(height: 20),
            ButtonPromptGeneration(text: 'Сгенерировать промпт', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
