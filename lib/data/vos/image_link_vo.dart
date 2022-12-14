import 'package:google_play_books_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_link_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_IMAGE_LINK_VO, adapterName: "ImageLinkVOAdapter")
class ImageLinkVO {

  @JsonKey(name: "smallThumbnail")
  @HiveField(0)
  String smallThumbnail;

  @JsonKey(name: "thumbnail")
  @HiveField(1)
  String thumbnail;

  ImageLinkVO(this.smallThumbnail, this.thumbnail);

  factory ImageLinkVO.fromJson(Map<String, dynamic> json) => _$ImageLinkVOFromJson(json);

  Map<String, dynamic> toJson() => _$ImageLinkVOToJson(this);
}