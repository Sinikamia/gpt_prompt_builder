import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gpt_prompt_builder/constants/prompt_category.dart';
import 'package:gpt_prompt_builder/features/home/domain/models/prompt_category_models.dart';
import 'package:gpt_prompt_builder/features/prompt_generation/domain/models/prompt_models.dart';
import 'package:gpt_prompt_builder/features/prompt_generation/presentation/ui/widgets/button_prompt_generation.dart';
import 'package:gpt_prompt_builder/features/prompt_generation/presentation/ui/widgets/category_universal.dart';
import 'package:gpt_prompt_builder/features/prompt_generation/presentation/ui/widgets/show_dropdown_menu.dart';
import 'package:gpt_prompt_builder/features/prompt_generation/presentation/ui/widgets/text_field_universal.dart';
import 'package:gpt_prompt_builder/shared/widgets/app_bar/app_bar_universal.dart';

class PromptGenerationScreen extends StatefulWidget {
  final String selectedCategory;
  const PromptGenerationScreen({super.key, required this.selectedCategory});

  @override
  State<PromptGenerationScreen> createState() => _PromptGenerationScreenState();
}

class _PromptGenerationScreenState extends State<PromptGenerationScreen> {
  final GlobalKey _CategoryMenuKey = GlobalKey();
  late String selectedCategory;
  bool _isMenuOpenCategory = false;
  late String selectedSubCategory;
  bool showSnackBarInsteadOfButton = false;
  String snackBarMessage = "";
  final TextEditingController _aiRoleController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();
  final TextEditingController _inputDescriptionController =
      TextEditingController();

  @override
  void dispose() {
    _aiRoleController.dispose();
    _goalController.dispose();
    _inputDescriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.selectedCategory;
    final subList = getSubCategoriesByCategory(selectedCategory);
    selectedSubCategory = subList.isNotEmpty ? subList.first : '';
  }

  List<String> getSubCategoriesByCategory(String category) {
    final categoryModel = promptCategories.firstWhere(
      (e) => e.category == category,
      orElse: () => PromptCategory(category: '', subCategories: []),
    );

    return categoryModel.subCategories.map((e) => e.subCategories).toList();
  }

  void _showDropdownMenu(BuildContext context) async {
    setState(() => _isMenuOpenCategory = true);

    final selected = await ShowDropdownMenu.show<String>(
      context: context,
      anchorKey: _CategoryMenuKey,
      items: promptCategories.map((e) => e.category).toList(),
    );

    setState(() => _isMenuOpenCategory = false);

    if (selected != null) {
      final subList = getSubCategoriesByCategory(selected);
      setState(() {
        selectedCategory = selected;
        selectedSubCategory = subList.isNotEmpty ? subList.first : '';
      });
    }
  }

  void showTemporarySnackBar(String message) {
    setState(() {
      showSnackBarInsteadOfButton = true;
      snackBarMessage = message;
    });
    Timer(const Duration(seconds: 2), () {
      setState(() {
        showSnackBarInsteadOfButton = false;
      });
    });
  }

  void promptGeneration() {
    if (_aiRoleController.text.isEmpty) {
      showTemporarySnackBar("Укажите роль ИИ");
      return;
    }

    if (_goalController.text.isEmpty) {
      showTemporarySnackBar("Опишите цель");
      return;
    }

    if (_inputDescriptionController.text.isEmpty) {
      showTemporarySnackBar("Укажите входные данные");
      return;
    }

    final prompt = PromptModel(
      aiRole: _aiRoleController.text.trim(),
      goal: _goalController.text.trim(),
      inputDescription: _inputDescriptionController.text.trim(),
      category: selectedCategory,
    );

    context.go("/prompt", extra: prompt);
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle myStyle = const TextStyle(
      color: Colors.white70,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBarUniversal(
        text: 'Создание промпта',
        onPressed: () => context.go('/'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  TextFieldUniversal(
                    controller: _aiRoleController,
                    text: 'Роль ИИ',
                    icon: Icons.person_outlined,
                    hintText:
                        'Пример: Автор деловых писем, копирайтер, маркетолог, Flutter-разработчик',
                  ),
                  TextFieldUniversal(
                    controller: _goalController,
                    text: 'Цель',
                    icon: Icons.flag_outlined,
                    hintText: 'Пример: Сделай письмо более профессиональным',
                  ),
                  TextFieldUniversal(
                    controller: _inputDescriptionController,
                    text: 'Входные данные',
                    icon: Icons.article_outlined,
                    hintText: 'Пример: Текст письма, тема, код, описание идеи',
                  ),
                  SizedBox(height: 20),
                  CategoryUniversal(
                    key: _CategoryMenuKey,
                    text: 'Категория',
                    textCategory: selectedCategory,
                    icon:
                        _isMenuOpenCategory
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                    onTap: () => _showDropdownMenu(context),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            showSnackBarInsteadOfButton
                ? Text(
                  snackBarMessage,
                  textAlign: TextAlign.center,
                  style: myStyle,
                )
                : IntrinsicWidth(
                  child: ButtonPromptGeneration(
                    text: 'Сгенерировать промпт',
                    onTap: promptGeneration,
                  ),
                ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
