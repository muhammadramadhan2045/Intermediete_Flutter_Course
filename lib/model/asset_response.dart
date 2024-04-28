import 'package:json_annotation/json_annotation.dart';

import 'quote.dart';

part 'asset_response.g.dart';

@JsonSerializable()
class AssetResponse {
  @JsonKey(name: 'list_quotes')
  final List<Quote> list;

  AssetResponse({
    required this.list,
  });

  // Map<String, dynamic> toJson() {
  //   return {
  //     'list_quotes': list.map((x) => x.toJson()).toList(),
  //   };
  // }

  // factory AssetResponse.fromJson(Map<String, dynamic> map) {
  //   return AssetResponse(
  //     list: List<Quote>.from(map['list_quotes']?.map((x) => Quote.fromJson(x))),
  //   );
  // }

  factory AssetResponse.fromJson(Map<String, dynamic> map) =>
      _$AssetResponseFromJson(map);

  Map<String, dynamic> toJson() => _$AssetResponseToJson(this);
}
