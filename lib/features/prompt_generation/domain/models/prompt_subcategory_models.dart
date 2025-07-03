class PromptSubCategory {
  final String subCategory;
  final String category;
  PromptSubCategory({required this.category, required this.subCategory});
  Map<String, dynamic> toJson() {
    return {'category': category, 'subCategory': subCategory};
  }
}
