import 'package:flutter/material.dart';
import 'package:gpt_prompt_builder/constants/prompt_category.dart';
import 'package:gpt_prompt_builder/features/home/domain/models/prompt_category_models.dart';
import 'package:gpt_prompt_builder/features/home/presentation/ui/widgets/button_category_prompts.dart';
import 'package:gpt_prompt_builder/shared/widgets/app_bar/app_bar_universal.dart';
import 'package:gpt_prompt_builder/shared/widgets/button/button_search.dart';

class HomeScreen extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String category) onTap;
  const HomeScreen({super.key, required this.controller, required this.onTap});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PromptCategory> filteredCategories = [];
  @override
  void initState() {
    super.initState();
    filteredCategories = List.from(promptCategories);
    widget.controller.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = widget.controller.text.toLowerCase().trim();

    setState(() {
      if (query.isEmpty) {
        filteredCategories = promptCategories;
      } else {
        filteredCategories =
            promptCategories.where((category) {
              // поиск по названию категории
              final inCategory = category.category.toLowerCase().contains(
                query,
              );

              // поиск по подкатегориям
              final inSubCategories = category.subCategories.any(
                (sub) => sub.subCategories.toLowerCase().contains(query),
              );

              return inCategory || inSubCategories;
            }).toList();
      }
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onSearchChanged);
    super.dispose();
  }

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
            child: ButtonSearch(controller: widget.controller),
          ),
          SizedBox(height: 15),
          ...List.generate((filteredCategories.length / 2).ceil(), (index) {
            final int firstIndex = index * 2;
            final int secondIndex = firstIndex + 1;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  ButtonCategoryPrompts(
                    text: filteredCategories[firstIndex].category,
                    icon: filteredCategories[firstIndex].icon ?? Icons.category,
                    onTap: widget.onTap,
                  ),
                  if (secondIndex < filteredCategories.length)
                    ButtonCategoryPrompts(
                      text: filteredCategories[secondIndex].category,
                      icon:
                          filteredCategories[secondIndex].icon ??
                          Icons.category,
                      onTap: widget.onTap,
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
