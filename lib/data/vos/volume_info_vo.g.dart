// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_info_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VolumeInfoVOAdapter extends TypeAdapter<VolumeInfoVO> {
  @override
  final int typeId = 11;

  @override
  VolumeInfoVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VolumeInfoVO(
      fields[0] as String,
      (fields[1] as List).cast<String>(),
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as ImageLinkVO,
    );
  }

  @override
  void write(BinaryWriter writer, VolumeInfoVO obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.authors)
      ..writeByte(2)
      ..write(obj.publisher)
      ..writeByte(3)
      ..write(obj.publishedDate)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.imageLinks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VolumeInfoVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumeInfoVO _$VolumeInfoVOFromJson(Map<String, dynamic> json) {
  return VolumeInfoVO(
    json['title'] as String,
    (json['authors'] as List<dynamic>).map((e) => e as String).toList(),
    json['publisher'] as String,
    json['publishedDate'] as String,
    json['description'] as String,
    ImageLinkVO.fromJson(json['imageLinks'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VolumeInfoVOToJson(VolumeInfoVO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'publishedDate': instance.publishedDate,
      'description': instance.description,
      'imageLinks': instance.imageLinks,
    };
