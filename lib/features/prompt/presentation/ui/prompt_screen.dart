import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gpt_prompt_builder/features/prompt/presentation/ui/widgets/button_prompt_screen.dart';
import 'package:gpt_prompt_builder/features/prompt/presentation/ui/widgets/text_card.dart';
import 'package:gpt_prompt_builder/features/prompt_generation/domain/models/prompt_models.dart';
import 'package:gpt_prompt_builder/shared/widgets/app_bar/app_bar_universal.dart';

class PromptScreen extends StatefulWidget {
  final PromptModel prompt;
  const PromptScreen({super.key, required this.prompt});

  @override
  State<PromptScreen> createState() => _PromptScreenState();
}

class _PromptScreenState extends State<PromptScreen> {
  @override
  Widget build(BuildContext context) {
    final prompt = widget.prompt;
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBarUniversal(
        text: 'Промпт',
        onPressed:
            () =>
                context.go('/generation', extra: widget.prompt.category ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextCard(name: "Название", text: ""),
            SizedBox(height: 20),
            TextCard(name: "Категория", text: prompt.category),
            SizedBox(height: 20),
            TextCard(name: "Подкатегория", text: ""),
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
