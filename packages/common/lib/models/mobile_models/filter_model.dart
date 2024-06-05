import 'package:common/models/mobile_models/subfiltertype_model.dart';

class FilterModel {
  final String title;
  final List<SubFilterModel>? subFilterModel;
  final List<int>? listId;
  final List<String>? listNames;

  FilterModel({
    this.listId,
    this.listNames,
    required this.title,
    this.subFilterModel,
  });
}
