import 'package:flutter/material.dart';
import 'package:gpt_prompt_builder/constants/prompt_category.dart';
import 'package:gpt_prompt_builder/features/home/domain/models/prompt_category_models.dart';
import 'package:gpt_prompt_builder/features/prompt/presentation/ui/prompt_screen.dart';
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
  final GlobalKey _CategoryMenuKey = GlobalKey();
  final GlobalKey _SubCategoryMenuKey = GlobalKey();
  late String selectedCategory;
  bool _isMenuOpenCategory = false;
  bool _isMenuOpenSubCategory = false;
  late String selectedSubCategory;

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
    setState(() {
      _isMenuOpenCategory = true;
    });
    final RenderBox renderBox =
        _CategoryMenuKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final screenSize = MediaQuery.of(context).size;
    final double menuHeight = promptCategories.length * 48.0;
    final double desiredWidth = 200;
    final double menuWidth = desiredWidth.clamp(150.0, 300.0);
    final double top = offset.dy - menuHeight;
    final double left = offset.dx + size.width - 200;
    final double right = screenSize.width - offset.dx - size.width;
    final double bottom = screenSize.height - offset.dy;
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(left, top, right, bottom),
      items: [
        PopupMenuItem<String>(
          enabled: false,
          child: SizedBox(
            width: menuWidth,
            height: promptCategories.length * 47.0,
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children:
                  promptCategories.map((promptCategory) {
                    return ListTile(
                      title: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white24,
                              width: 0.3,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            promptCategory.category,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context, promptCategory.category);
                      },
                    );
                  }).toList(),
            ),
          ),
        ),
      ],
      elevation: 4,
      color: Color(0xFF1C1C1E),
    );
    setState(() {
      _isMenuOpenCategory = false;
    });
    if (selected != null) {
      final subList = getSubCategoriesByCategory(selected);
      setState(() {
        selectedCategory = selected;
        selectedSubCategory = subList.isNotEmpty ? subList.first : '';
      });
    }
  }

  void _showDropdownMenuSubCategory(BuildContext context) async {
    setState(() {
      _isMenuOpenSubCategory = true;
    });
    final RenderBox renderBox =
        _SubCategoryMenuKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final screenSize = MediaQuery.of(context).size;
    final subCategoryList = getSubCategoriesByCategory(selectedCategory);
    if (subCategoryList.isEmpty) {
      setState(() => _isMenuOpenSubCategory = false);
      return;
    }
    final double menuHeight = subCategoryList.length * 48.0;
    final double desiredWidth = 200;
    final double menuWidth = desiredWidth.clamp(150.0, 300.0);
    final double top = offset.dy - menuHeight;
    final double left = offset.dx + size.width - 200;
    final double right = screenSize.width - offset.dx - size.width;
    final double bottom = screenSize.height - offset.dy;
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(left, top, right, bottom),
      items: [
        PopupMenuItem<String>(
          enabled: false,
          child: SizedBox(
            width: menuWidth,
            height: subCategoryList.length * 47.0,
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children:
                  subCategoryList.map((subCategory) {
                    return ListTile(
                      title: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white24,
                              width: 0.3,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            subCategory,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context, subCategory);
                      },
                    );
                  }).toList(),
            ),
          ),
        ),
      ],
      elevation: 4,
      color: Color(0xFF1C1C1E),
    );
    setState(() {
      _isMenuOpenSubCategory = false;
    });
    if (selected != null) {
      setState(() {
        selectedSubCategory = selected;
      });
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
            ButtonPromptGeneration(
              text: 'Сгенерировать промпт',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PromptScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
