import 'package:google_play_books_app/data/vos/book_details_vo.dart';
import 'package:google_play_books_app/data/vos/isbns_vo.dart';
import 'package:google_play_books_app/data/vos/reviews_vo.dart';
import 'package:google_play_books_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_list_result_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_BOOK_LIST_RESULT_VO, adapterName: "BookListResultVOAdapter")
class BookListResultVO {

  @JsonKey(name: "list_name")
  @HiveField(0)
  String listName;

  @JsonKey(name: "display_name")
  @HiveField(1)
  String displayName;

  @JsonKey(name: "bestsellers_date")
  @HiveField(2)
  String bestsellersDate;

  @JsonKey(name: "published_date")
  @HiveField(3)
  String publishedDate;

  @JsonKey(name: "rank")
  @HiveField(4)
  int rank;

  @JsonKey(name: "rank_last_week")
  @HiveField(5)
  int rankLastWeek;

  @JsonKey(name: "weeks_on_list")
  @HiveField(6)
  int weeksOnList;

  @JsonKey(name: "asterisk")
  @HiveField(7)
  int asterisk;

  @JsonKey(name: "dagger")
  @HiveField(8)
  int dagger;

  @JsonKey(name: "amazon_product_url")
  @HiveField(9)
  String amazonProductUrl;

  @JsonKey(name: "isbns")
  @HiveField(10)
  List<IsbnsVO> isbns;

  @JsonKey(name: "book_details")
  @HiveField(11)
  List<BookDetailsVO> bookDetails;

  @JsonKey(name: "reviews")
  @HiveField(12)
  List<ReviewsVO> reviews;

  BookListResultVO(
      this.listName,
      this.displayName,
      this.bestsellersDate,
      this.publishedDate,
      this.rank,
      this.rankLastWeek,
      this.weeksOnList,
      this.asterisk,
      this.dagger,
      this.amazonProductUrl,
      this.isbns,
      this.bookDetails,
      this.reviews);

  factory BookListResultVO.fromJson(Map<String, dynamic> json) => _$BookListResultVOFromJson(json);

  Map<String, dynamic> toJson() => _$BookListResultVOToJson(this);
}