// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_search_items_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookSearchItemsVOAdapter extends TypeAdapter<BookSearchItemsVO> {
  @override
  final int typeId = 5;

  @override
  BookSearchItemsVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookSearchItemsVO(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as VolumeInfoVO,
    );
  }

  @override
  void write(BinaryWriter writer, BookSearchItemsVO obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.kind)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.etag)
      ..writeByte(3)
      ..write(obj.selfLink)
      ..writeByte(4)
      ..write(obj.volumeInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookSearchItemsVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookSearchItemsVO _$BookSearchItemsVOFromJson(Map<String, dynamic> json) {
  return BookSearchItemsVO(
    json['kind'] as String,
    json['id'] as String,
    json['etag'] as String,
    json['selfLink'] as String,
    VolumeInfoVO.fromJson(json['volumeInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BookSearchItemsVOToJson(BookSearchItemsVO instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'id': instance.id,
      'etag': instance.etag,
      'selfLink': instance.selfLink,
      'volumeInfo': instance.volumeInfo,
    };
