import 'package:google_play_books_app/data/vos/book_list_result_vo.dart';
import 'package:google_play_books_app/data/vos/book_overview_list_vo.dart';
import 'package:google_play_books_app/data/vos/book_overview_result_vo.dart';
import 'package:google_play_books_app/data/vos/books_vo.dart';
import 'package:hive/hive.dart';

import '../hive_constants.dart';

class BookOverviewDao {
  static final BookOverviewDao _singleton = BookOverviewDao._internal();

  factory BookOverviewDao() {
    return _singleton;
  }

  BookOverviewDao._internal();

  void saveAllBookOverviewList(BookOverviewResultVO bookOverviewResult) async {
    List<BookOverviewListVO> bookOverviewList = bookOverviewResult.lists;


    List<BookOverviewListVO> updatedBookOverviewList = bookOverviewList
        .map((book) {
          book.publishedDate = bookOverviewResult.publishedDate;
        })
        .cast<BookOverviewListVO>()
        .toList();

    Map<int, BookOverviewListVO> bookOverviewMap = Map.fromIterable(
        updatedBookOverviewList,
        key: (book) => book.listId,
        value: (book) => book);
    await getBookOverviewBox().putAll(bookOverviewMap);
  }

  /// Reactive Programming
  Stream<void> getAllBooksOverviewEventStream() {
    return getBookOverviewBox().watch();
  }

  Stream<List<BookOverviewListVO>> getAllBooksOverviewListStream() {
    return Stream.value(getBookOverviewBox().values.toList());
  }

  List<BookOverviewListVO> getAllBooksOverviewList() {
    return getBookOverviewBox().values.toList();
  }

  Stream<BookOverviewListVO> getBookDetailStream(int listId) {
    return Stream.value(getAllBooksOverviewList()
        .where((element) => element.listId == listId)
        .first);
  }

  Box<BookOverviewListVO> getBookOverviewBox() {
    return Hive.box<BookOverviewListVO>(BOX_NAME_BOOK_OVERVIEW_LIST_VO);
  }
}
