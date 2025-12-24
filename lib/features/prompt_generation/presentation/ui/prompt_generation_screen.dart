import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gpt_prompt_builder/constants/prompt_category.dart';
import 'package:gpt_prompt_builder/features/home/domain/models/prompt_category_models.dart';
import 'package:gpt_prompt_builder/features/prompt/presentation/ui/prompt_screen.dart';
import 'package:gpt_prompt_builder/features/prompt_generation/presentation/ui/widgets/button_prompt_generation.dart';
import 'package:gpt_prompt_builder/features/prompt_generation/presentation/ui/widgets/category_universal.dart';
import 'package:gpt_prompt_builder/features/prompt_generation/presentation/ui/widgets/showDropdownMenu.dart';
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
  final GlobalKey _SubCategoryMenuKey = GlobalKey();
  late String selectedCategory;
  bool _isMenuOpenCategory = false;
  bool _isMenuOpenSubCategory = false;
  late String selectedSubCategory;
  bool showSnackBarInsteadOfButton = false;
  String snackBarMessage = "";
  final TextEditingController _templateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _hintController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _templateController.dispose();
    _descriptionController.dispose();
    _hintController.dispose();
    _titleController.dispose();
    super.dispose();
  }

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

  void _showDropdownMenuSubCategory(BuildContext context) async {
    setState(() => _isMenuOpenSubCategory = true);

    final subCategories = getSubCategoriesByCategory(selectedCategory);
    if (subCategories.isEmpty) {
      setState(() => _isMenuOpenSubCategory = false);
      return;
    }

    final selected = await ShowDropdownMenu.show<String>(
      context: context,
      anchorKey: _SubCategoryMenuKey,
      items: subCategories,
    );

    setState(() => _isMenuOpenSubCategory = false);

    if (selected != null) {
      setState(() => selectedSubCategory = selected);
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
    if (_templateController.text.isEmpty) {
      showTemporarySnackBar("Заполните поле шаблона промпта");
    } else if (_descriptionController.text.isEmpty) {
      showTemporarySnackBar("Заполните поле описание");
    } else if (_hintController.text.isEmpty) {
      showTemporarySnackBar("Заполните поле подсказки промпта");
    } else if (_titleController.text.isEmpty) {
      showTemporarySnackBar("Заполните поле название промпта");
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PromptScreen()),
      );
    }
  }

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
              controller: _templateController,
              text: 'Шаблон промпта',
              icon: Icons.description_outlined,
              hintText:
                  'Пример: Я хочу, чтобы ты выступал как автор писем. Твоя задача — написать письмо на основе того, что я предоставлю, чтобы чётко выразить мои мысли. Мой первый запрос: [Подсказка к промпту]',
            ),
            TextFieldUniversal(
              controller: _descriptionController,
              text: 'Описание',
              icon: Icons.edit_note,
              hintText: 'Пример: Сделай письмо более профессиональным',
            ),
            TextFieldUniversal(
              controller: _hintController,
              text: 'Подсказка к промпту',
              icon: Icons.tips_and_updates_outlined,
              hintText: 'Пример: Тема вашего письма',
            ),
            TextFieldUniversal(
              controller: _titleController,
              text: 'Название промпта',
              icon: Icons.drive_file_rename_outline,
              hintText: 'Пример: Лучший шаблон письма',
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
            CategoryUniversal(
              key: _SubCategoryMenuKey,
              text: 'Подкатегория',
              textCategory: selectedSubCategory,
              icon:
                  _isMenuOpenSubCategory
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
              onTap: () => _showDropdownMenuSubCategory(context),
            ),
            SizedBox(height: 20),
            showSnackBarInsteadOfButton
                ? Center(
                  child: Text(
                    snackBarMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
                : ButtonPromptGeneration(
                  text: 'Сгенерировать промпт',
                  onTap: promptGeneration,
                ),
          ],
        ),
      ),
    );
  }
}
