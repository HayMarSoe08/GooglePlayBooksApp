import 'package:google_play_books_app/data/vos/book_overview_list_vo.dart';
import 'package:google_play_books_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_overview_result_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_BOOK_OVERVIEW_RESULT_VO, adapterName: "BookOverviewResultVOAdapter")
class BookOverviewResultVO {

  @JsonKey(name: "bestsellers_date")
  @HiveField(0)
  String bestsellersDate;

  @JsonKey(name: "published_date")
  @HiveField(1)
  String publishedDate;

  @JsonKey(name: "published_date_description")
  @HiveField(2)
  String publishedDateDescription;

  @JsonKey(name: "previous_published_date")
  @HiveField(3)
  String previousPublishedDate;

  @JsonKey(name: "next_published_date")
  @HiveField(4)
  String nextPublishedDate;

  @JsonKey(name: "lists")
  @HiveField(5)
  List<BookOverviewListVO> lists;

  BookOverviewResultVO(
      this.bestsellersDate,
      this.publishedDate,
      this.publishedDateDescription,
      this.previousPublishedDate,
      this.nextPublishedDate,
      this.lists);

  factory BookOverviewResultVO.fromJson(Map<String, dynamic> json) => _$BookOverviewResultVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookOverviewResultVOToJson(this);
}