// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_overview_list_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookOverviewListVOAdapter extends TypeAdapter<BookOverviewListVO> {
  @override
  final int typeId = 3;

  @override
  BookOverviewListVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookOverviewListVO(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      (fields[8] as List).cast<BooksVO>(),
      fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookOverviewListVO obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.listId)
      ..writeByte(1)
      ..write(obj.listName)
      ..writeByte(2)
      ..write(obj.listNameEncoded)
      ..writeByte(3)
      ..write(obj.displayName)
      ..writeByte(4)
      ..write(obj.updated)
      ..writeByte(5)
      ..write(obj.listImage)
      ..writeByte(6)
      ..write(obj.listImageWidth)
      ..writeByte(7)
      ..write(obj.listImageHeight)
      ..writeByte(8)
      ..write(obj.books)
      ..writeByte(9)
      ..write(obj.publishedDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookOverviewListVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookOverviewListVO _$BookOverviewListVOFromJson(Map<String, dynamic> json) {
  return BookOverviewListVO(
    json['list_id'] as int,
    json['list_name'] as String,
    json['list_name_encoded'] as String,
    json['display_name'] as String,
    json['updated'] as String,
    json['list_image'] as String,
    json['list_image_width'] as String,
    json['list_image_height'] as String,
    (json['books'] as List<dynamic>)
        .map((e) => BooksVO.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['publishedDate'] as String,
  );
}

Map<String, dynamic> _$BookOverviewListVOToJson(BookOverviewListVO instance) =>
    <String, dynamic>{
      'list_id': instance.listId,
      'list_name': instance.listName,
      'list_name_encoded': instance.listNameEncoded,
      'display_name': instance.displayName,
      'updated': instance.updated,
      'list_image': instance.listImage,
      'list_image_width': instance.listImageWidth,
      'list_image_height': instance.listImageHeight,
      'books': instance.books,
      'publishedDate': instance.publishedDate,
    };
