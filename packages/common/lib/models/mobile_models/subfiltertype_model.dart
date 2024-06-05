class SubFilterModel {
  final String? filterText;
  final FilterType? filterType;
  final int id;
  int isSelected;

  SubFilterModel({
    this.filterText,
    this.filterType,
    required this.id,
    this.isSelected = 0,
  });
}

enum FilterType { speciality, fees, rating, distance, availability }
