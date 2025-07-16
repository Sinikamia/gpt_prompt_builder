import 'package:flutter/material.dart';
import 'package:gpt_prompt_builder/constants/prompt_category.dart';
import 'package:gpt_prompt_builder/features/home/presentation/ui/widgets/button_category_prompts.dart';
import 'package:gpt_prompt_builder/shared/widgets/app_bar/app_bar_universal.dart';
import 'package:gpt_prompt_builder/shared/widgets/button/button_search.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String category) onTap;
  const HomeScreen({super.key, required this.controller, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBarUniversal(
        text: 'Генератор промптов',
        icon: Icons.person,
        onTap: () {},
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 5, bottom: 20),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ButtonSearch(controller: controller),
          ),
          SizedBox(height: 15),
          ...List.generate((promptCategories.length / 2).ceil(), (index) {
            final int firstIndex = index * 2;
            final int secondIndex = firstIndex + 1;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  ButtonCategoryPrompts(
                    text: promptCategories[firstIndex].category,
                    icon: promptCategories[firstIndex].icon ?? Icons.category,
                    onTap: onTap,
                  ),
                  if (secondIndex < promptCategories.length)
                    ButtonCategoryPrompts(
                      text: promptCategories[secondIndex].category,
                      icon:
                          promptCategories[secondIndex].icon ?? Icons.category,
                      onTap: onTap,
                    )
                  else
                    SizedBox(),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
