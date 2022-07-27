import 'package:google_play_books_app/data/vos/book_list_result_vo.dart';
import 'package:hive/hive.dart';

import '../hive_constants.dart';

class BookListDao {
  static final BookListDao _singleton = BookListDao._internal();

  factory BookListDao() {
    return _singleton;
  }

  BookListDao._internal();

  void saveAllBookList(List<BookListResultVO> bookList) async {

    Map<int, BookListResultVO> bookListMap = Map.fromIterable(bookList,
        key: (book) => book.rank, value: (book) => book);
    await getBookListBox().putAll(bookListMap);
  }

  /// Reactive Programming
  Stream<void> getAllBooksListEventStream() {
    return getBookListBox().watch();
  }

  Stream<List<BookListResultVO>> getAllBooksListStream() {
    return Stream.value(getBookListBox().values.toList());
  }

  List<BookListResultVO> getAllBooksList() {
    return getBookListBox().values.toList();
  }

  Box<BookListResultVO> getBookListBox() {
    return Hive.box<BookListResultVO>(BOX_NAME_BOOK_LIST_RESULT_VO);
  }
}
