import 'package:flutter/material.dart';
import 'package:gpt_prompt_builder/constants/prompt_category.dart';
import 'package:gpt_prompt_builder/features/home/presentation/ui/widgets/button_category_prompts.dart';
import 'package:gpt_prompt_builder/shared/widgets/app_bar/app_bar_home_screen.dart';
import 'package:gpt_prompt_builder/shared/widgets/button/button_search.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController controller;
  const HomeScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBarHomeScreen(text: 'Генератор промптов', onTap: () {}),
      body: Column(
        children: [
          SizedBox(height: 5),
          ButtonSearch(controller: controller),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: (promptCategories.length / 2).ceil(),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final int firstIndex = index * 2;
                final int secondIndex = firstIndex + 1;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ButtonCategoryPrompts(
                              text: promptCategories[firstIndex].category,
                              icon: promptCategories[firstIndex].icon,
                              onTap: () {},
                            ),
                          ),
                          if (secondIndex < promptCategories.length)
                            Expanded(
                              child: ButtonCategoryPrompts(
                                text: promptCategories[secondIndex].category,
                                icon: promptCategories[secondIndex].icon,
                                onTap: () {},
                              ),
                            )
                          else
                            const Expanded(child: SizedBox()),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
