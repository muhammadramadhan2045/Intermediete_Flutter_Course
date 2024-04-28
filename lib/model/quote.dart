import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quote.g.dart';

part 'quote.freezed.dart';

@freezed
class Quote with _$Quote {
  // final String id;
  // final String en;
  // final String author;
  // final double rating;

  // Quote({
  //   required this.id,
  //   required this.en,
  //   required this.author,
  //   required this.rating,
  // });

  const factory Quote({
    required String id,
    required String en,
    required String author,
    required double rating,
  }) = _Quote;

  // factory Quote.fromJson(Map<String, dynamic> map) {
  //   return Quote(
  //     id: map['id'] ?? '',
  //     en: map['en'] ?? '',
  //     author: map['author'] ?? '',
  //     rating: map['rating']?.toDouble() ?? 0.0,
  //   );
  // }

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'en': en,
  //       'author': author,
  //       'rating': rating,
  //     };

  factory Quote.fromJson(Map<String, dynamic> map) => _$QuoteFromJson(map);
}
