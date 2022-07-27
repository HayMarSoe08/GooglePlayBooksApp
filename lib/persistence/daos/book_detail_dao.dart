import 'package:google_play_books_app/data/vos/books_vo.dart';
import 'package:google_play_books_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';

class BookDetailDao {
  static final BookDetailDao _singleton = BookDetailDao._internal();

  factory BookDetailDao() {
    return _singleton;
  }

  BookDetailDao._internal();

  void saveAllBookDetail(BooksVO book) async {
    await getBookListBox().put(book.title, book);
  }

  List<BooksVO> getAllBookDetailList() {
    List<BooksVO> bookList = [];
    for (int i = 0; i < getBookListBox().length; i++) {
      bookList.add(getBookListBox().getAt(i)!);
    }
    return bookList;
  }

  Box<BooksVO> getBookListBox() {
    return Hive.box<BooksVO>(BOX_NAME_BOOK_LIST_SAVE_TO_HIVE_VO);
  }
}
