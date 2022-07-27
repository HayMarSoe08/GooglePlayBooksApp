import 'package:google_play_books_app/data/vos/book_list_result_vo.dart';
import 'package:google_play_books_app/data/vos/book_overview_list_vo.dart';
import 'package:google_play_books_app/data/vos/book_overview_result_vo.dart';
import 'package:google_play_books_app/data/vos/book_search_items_vo.dart';

abstract class LibraryDataAgent {
  Future<BookOverviewResultVO?> getBookOverview(
      String publishedDate,
      );

  Future<List<BookListResultVO>> getBookList(
      String publishedDate,
      String list,
      );

  Future<List<BookSearchItemsVO?>?> getSearchBook(
      String q,
      );
}