
import 'package:google_play_books_app/data/vos/volume_info_vo.dart';
import 'package:google_play_books_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_search_items_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_BOOK_SEARCH_ITEMS_VO, adapterName: "BookSearchItemsVOAdapter")
class BookSearchItemsVO {

  @JsonKey(name: "kind")
  @HiveField(0)
  String kind;

  @JsonKey(name: "id")
  @HiveField(1)
  String id;

  @JsonKey(name: "etag")
  @HiveField(2)
  String etag;

  @JsonKey(name: "selfLink")
  @HiveField(3)
  String selfLink;

  @JsonKey(name: "volumeInfo")
  @HiveField(4)
  VolumeInfoVO volumeInfo;

  BookSearchItemsVO(this.kind, this.id, this.etag, this.selfLink, this.volumeInfo);

  factory BookSearchItemsVO.fromJson(Map<String, dynamic> json) => _$BookSearchItemsVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookSearchItemsVOToJson(this);
}