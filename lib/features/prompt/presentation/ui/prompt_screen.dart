import 'package:flutter/material.dart';
import 'package:gpt_prompt_builder/features/prompt/presentation/ui/widgets/button_prompt_screen.dart';
import 'package:gpt_prompt_builder/features/prompt/presentation/ui/widgets/text_card.dart';
import 'package:gpt_prompt_builder/shared/widgets/app_bar/app_bar_universal.dart';

class PromptScreen extends StatefulWidget {
  const PromptScreen({super.key});

  @override
  State<PromptScreen> createState() => _PromptScreenState();
}

class _PromptScreenState extends State<PromptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBarUniversal(
        text: 'Промпт',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextCard(name: "Название", text: "Текст"),
            SizedBox(height: 20),
            TextCard(name: "Категория", text: "Текст"),
            SizedBox(height: 20),
            TextCard(name: "Подкатегория", text: "Текст"),
            SizedBox(height: 30),
            TextCard(text: "Текст"),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonPromptScreen(
                  icon: Icons.save_outlined,
                  text: 'Сохранить',
                  onTap: () {},
                ),
                SizedBox(width: 13),
                ButtonPromptScreen(
                  icon: Icons.copy,
                  text: 'Копировать',
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            ButtonPromptScreen(
              icon: Icons.mode_edit_outlined,
              text: 'Редактировать',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
