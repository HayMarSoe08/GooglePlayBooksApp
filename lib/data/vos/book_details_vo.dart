import 'package:google_play_books_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_details_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_BOOK_DETAIL_VO, adapterName: "BookDetailsVOAdapter")
class BookDetailsVO {

  @JsonKey(name: "title")
  @HiveField(0)
  String title;

  @JsonKey(name: "description")
  @HiveField(1)
  String description;

  @JsonKey(name: "contributor")
  @HiveField(2)
  String contributor;

  @JsonKey(name: "author")
  @HiveField(3)
  String author;

  @JsonKey(name: "contributor_note")
  @HiveField(4)
  String contributorNote;

  @JsonKey(name: "price")
  @HiveField(5)
  String price;

  @JsonKey(name: "age_group")
  @HiveField(6)
  String ageGroup;

  @JsonKey(name: "publisher")
  @HiveField(7)
  String publisher;

  @JsonKey(name: "primary_isbn13")
  @HiveField(8)
  String primaryIsbn13;

  @JsonKey(name: "primary_isbn10")
  @HiveField(9)
  String primaryIsbn10;

  BookDetailsVO(
      this.title,
      this.description,
      this.contributor,
      this.author,
      this.contributorNote,
      this.price,
      this.ageGroup,
      this.publisher,
      this.primaryIsbn13,
      this.primaryIsbn10);

  factory BookDetailsVO.fromJson(Map<String, dynamic> json) => _$BookDetailsVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookDetailsVOToJson(this);
}