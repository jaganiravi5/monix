class CategoryModel {
  String id;
  String categoryName;
  bool isSelected;

  CategoryModel({
    required this.id,
    required this.categoryName,
    required this.isSelected,
  });
}

enum CategoryType { membersList, activityTypeList, apiList, contactList }
