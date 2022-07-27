import 'package:google_play_books_app/data/vos/book_search_items_vo.dart';
import 'package:hive/hive.dart';

import '../hive_constants.dart';

class SearchBookDao {
  static final SearchBookDao _singleton = SearchBookDao._internal();

  factory SearchBookDao() {
    return _singleton;
  }

  SearchBookDao._internal();

  void saveAllBookSearchItemList(
      List<BookSearchItemsVO?> bookSearchItemList) async {
    Map<int, BookSearchItemsVO> bookSearchItemMap = Map.fromIterable(
        bookSearchItemList,
        key: (book) => book.id,
        value: (book) => book);
    await getBookSearchItemBox().putAll(bookSearchItemMap);
  }

  /// Reactive Programming
  Stream<void> getAllBookSearchItemEventStream() {
    return getBookSearchItemBox().watch();
  }

  Stream<List<BookSearchItemsVO>> getAllBookSearchItemListStream() {
    return Stream.value(getBookSearchItemBox().values.toList());
  }

  List<BookSearchItemsVO> getAllBookSearchItemList() {
    return getBookSearchItemBox().values.toList();
  }

  Box<BookSearchItemsVO> getBookSearchItemBox() {
    return Hive.box<BookSearchItemsVO>(BOX_NAME_BOOK_SEARCH_ITEMS_VO);
  }
}
