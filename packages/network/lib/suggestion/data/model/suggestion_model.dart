import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggestion_model.freezed.dart';

part 'suggestion_model.g.dart';
@freezed
class SuggestionModel with _$SuggestionModel {
    const factory SuggestionModel({
        String? name,
        String? suggestion,
       @JsonKey(name: '_id') String? id,
        int? v,
    }) = _SuggestionModel;
      factory SuggestionModel.fromJson(Map<String, dynamic> json) => _$SuggestionModelFromJson(json);
}
