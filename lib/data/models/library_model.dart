import 'package:google_play_books_app/data/vos/book_list_result_vo.dart';
import 'package:google_play_books_app/data/vos/book_overview_list_vo.dart';
import 'package:google_play_books_app/data/vos/book_search_items_vo.dart';
import 'package:google_play_books_app/data/vos/books_vo.dart';

abstract class LibraryModel{
  // Network
  void getBookOverview(String publishedDate);

  void getBookList(String publishedDate, String list);

  void getSearchBook(String q);

  // Database
  Future<List<BookOverviewListVO>> getBookOverviewFromDatabase(
      String publishedDate);

  Future<List<BookListResultVO>> getBookListFromDatabase(
      String publishedDate, String list);

  Future<List<BookSearchItemsVO>> getSearchBookFromDatabase(String q);

  Future<BookOverviewListVO> getBookDetailsFromDatabase(
      int listId);

  void setBookDetailsToDatabase(
      BooksVO book);

  Future<List<BooksVO>> getAllBookDetailListFromDatabase();
}
