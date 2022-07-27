import 'package:google_play_books_app/data/vos/book_search_items_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_book_response.g.dart';

@JsonSerializable()
class SearchBookResponse {

  @JsonKey(name: "kind")
  String kind;

  @JsonKey(name: "totalItems")
  int totalItems;

  @JsonKey(name: "items")
  List<BookSearchItemsVO> items;

  SearchBookResponse(this.kind, this.totalItems, this.items);

  factory SearchBookResponse.fromJson(Map<String, dynamic> json) => _$SearchBookResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchBookResponseToJson(this);
}