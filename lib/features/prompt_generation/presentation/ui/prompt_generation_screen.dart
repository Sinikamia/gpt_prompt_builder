import 'package:flutter/material.dart';
import 'package:gpt_prompt_builder/features/prompt_generation/presentation/ui/widgets/button_prompt_generation.dart';
import 'package:gpt_prompt_builder/features/prompt_generation/presentation/ui/widgets/text_field_universal.dart';
import 'package:gpt_prompt_builder/shared/widgets/app_bar/app_bar_universal.dart';

class PromptGenerationScreen extends StatelessWidget {
  const PromptGenerationScreen({super.key});

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
              hintText: 'Введите название промпта',
            ),
            TextFieldUniversal(
              text: 'Описание',
              icon: Icons.edit_note,
              hintText: 'Введите описание промпта',
            ),
            TextFieldUniversal(
              text: 'Подсказка к промпту',
              icon: Icons.tips_and_updates_outlined,
              hintText: 'Введите параметры промпта',
            ),
            TextFieldUniversal(
              text: 'Название промпта',
              icon: Icons.drive_file_rename_outline,
              hintText: 'Введите пример промпта',
            ),
            SizedBox(height: 20),
            ButtonPromptGeneration(text: 'Сгенерировать промпт', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
