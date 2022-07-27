// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_list_result_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookListResultVOAdapter extends TypeAdapter<BookListResultVO> {
  @override
  final int typeId = 2;

  @override
  BookListResultVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookListResultVO(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as int,
      fields[5] as int,
      fields[6] as int,
      fields[7] as int,
      fields[8] as int,
      fields[9] as String,
      (fields[10] as List).cast<IsbnsVO>(),
      (fields[11] as List).cast<BookDetailsVO>(),
      (fields[12] as List).cast<ReviewsVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, BookListResultVO obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.listName)
      ..writeByte(1)
      ..write(obj.displayName)
      ..writeByte(2)
      ..write(obj.bestsellersDate)
      ..writeByte(3)
      ..write(obj.publishedDate)
      ..writeByte(4)
      ..write(obj.rank)
      ..writeByte(5)
      ..write(obj.rankLastWeek)
      ..writeByte(6)
      ..write(obj.weeksOnList)
      ..writeByte(7)
      ..write(obj.asterisk)
      ..writeByte(8)
      ..write(obj.dagger)
      ..writeByte(9)
      ..write(obj.amazonProductUrl)
      ..writeByte(10)
      ..write(obj.isbns)
      ..writeByte(11)
      ..write(obj.bookDetails)
      ..writeByte(12)
      ..write(obj.reviews);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookListResultVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookListResultVO _$BookListResultVOFromJson(Map<String, dynamic> json) {
  return BookListResultVO(
    json['list_name'] as String,
    json['display_name'] as String,
    json['bestsellers_date'] as String,
    json['published_date'] as String,
    json['rank'] as int,
    json['rank_last_week'] as int,
    json['weeks_on_list'] as int,
    json['asterisk'] as int,
    json['dagger'] as int,
    json['amazon_product_url'] as String,
    (json['isbns'] as List<dynamic>)
        .map((e) => IsbnsVO.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['book_details'] as List<dynamic>)
        .map((e) => BookDetailsVO.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['reviews'] as List<dynamic>)
        .map((e) => ReviewsVO.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BookListResultVOToJson(BookListResultVO instance) =>
    <String, dynamic>{
      'list_name': instance.listName,
      'display_name': instance.displayName,
      'bestsellers_date': instance.bestsellersDate,
      'published_date': instance.publishedDate,
      'rank': instance.rank,
      'rank_last_week': instance.rankLastWeek,
      'weeks_on_list': instance.weeksOnList,
      'asterisk': instance.asterisk,
      'dagger': instance.dagger,
      'amazon_product_url': instance.amazonProductUrl,
      'isbns': instance.isbns,
      'book_details': instance.bookDetails,
      'reviews': instance.reviews,
    };
