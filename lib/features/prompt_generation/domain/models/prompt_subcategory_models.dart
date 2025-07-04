class PromptSubCategory {
  final String category;
  final List<String> subCategory;
  PromptSubCategory({required this.category, required this.subCategory});
  Map<String, dynamic> toJson() {
    return {'category': category, 'subCategory': subCategory};
  }

  factory PromptSubCategory.fromJson(Map<String, dynamic> json) {
    return PromptSubCategory(
      category: json['category'],
      subCategory: List<String>.from(json['subCategory']),
    );
  }
}
