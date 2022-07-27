import 'package:google_play_books_app/data/vos/image_link_vo.dart';
import 'package:google_play_books_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'volume_info_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_VOLUME_INFO_VO, adapterName: "VolumeInfoVOAdapter")
class VolumeInfoVO {

  @JsonKey(name: "title")
  @HiveField(0)
  String title;

  @JsonKey(name: "authors")
  @HiveField(1)
  List<String> authors;

  @JsonKey(name: "publisher")
  @HiveField(2)
  String publisher;

  @JsonKey(name: "publishedDate")
  @HiveField(3)
  String publishedDate;

  @JsonKey(name: "description")
  @HiveField(4)
  String description;

  @JsonKey(name: "imageLinks")
  @HiveField(5)
  ImageLinkVO imageLinks;

  VolumeInfoVO(this.title, this.authors, this.publisher, this.publishedDate,
      this.description, this.imageLinks);

  factory VolumeInfoVO.fromJson(Map<String, dynamic> json) => _$VolumeInfoVOFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeInfoVOToJson(this);
}