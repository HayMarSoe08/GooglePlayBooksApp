// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_book_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchBookResponse _$SearchBookResponseFromJson(Map<String, dynamic> json) {
  return SearchBookResponse(
    json['kind'] as String,
    json['totalItems'] as int,
    (json['items'] as List<dynamic>)
        .map((e) => BookSearchItemsVO.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SearchBookResponseToJson(SearchBookResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'totalItems': instance.totalItems,
      'items': instance.items,
    };
