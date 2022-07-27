import 'package:google_play_books_app/data/models/library_model.dart';
import 'package:google_play_books_app/data/vos/book_list_result_vo.dart';
import 'package:google_play_books_app/data/vos/book_overview_list_vo.dart';
import 'package:google_play_books_app/data/vos/book_search_items_vo.dart';
import 'package:google_play_books_app/data/vos/books_vo.dart';
import 'package:google_play_books_app/network/dataagents/library_data_agent.dart';
import 'package:google_play_books_app/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:google_play_books_app/persistence/daos/book_detail_dao.dart';
import 'package:google_play_books_app/persistence/daos/book_list_dao.dart';
import 'package:google_play_books_app/persistence/daos/book_overview_dao.dart';
import 'package:google_play_books_app/persistence/daos/search_book_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class LibraryModelImpl extends LibraryModel {
  BookListDao mBookListDao = new BookListDao();
  BookOverviewDao mBookOverviewDao = new BookOverviewDao();
  SearchBookDao mSearchBookDao = new SearchBookDao();
  BookDetailDao mBookDetailDao = new BookDetailDao();

  LibraryDataAgent mDataAgent = RetrofitDataAgentImpl();

  static final LibraryModelImpl _singleton = LibraryModelImpl._internal();

  factory LibraryModelImpl() {
    return _singleton;
  }

  LibraryModelImpl._internal();

  // Network
  @override
  void getBookOverview(String publishedDate) {
    mDataAgent.getBookOverview(publishedDate).then((bookOverviewResult) async {
      mBookOverviewDao.saveAllBookOverviewList(bookOverviewResult!);
      //return Future.value(bookOverviewList ?? []);
    });
  }

  @override
  void getBookList(String publishedDate, String list) {
    mDataAgent.getBookList(publishedDate, list).then((bookList) async {
      mBookListDao.saveAllBookList(bookList);
      //return Future.value(bookList);
    });
  }

  @override
  void getSearchBook(String q) {
    mDataAgent.getSearchBook(q).then((searchBookList) async {
      mSearchBookDao.saveAllBookSearchItemList(searchBookList!);
      //return Future.value(searchBookList ?? []);
    });
  }

  // Database
  @override
  Future<List<BookOverviewListVO>> getBookOverviewFromDatabase(
      String publishedDate) {
    this.getBookOverview(publishedDate);
    return mBookOverviewDao
        .getAllBooksOverviewEventStream()
        .startWith(mBookOverviewDao.getAllBooksOverviewListStream())
        .combineLatest(
            mBookOverviewDao.getAllBooksOverviewListStream(),
            (event, BookOverviewtList) =>
                BookOverviewtList as List<BookOverviewListVO>)
        .first;
  }

  @override
  Future<List<BookListResultVO>> getBookListFromDatabase(
      String publishedDate, String list) {
    this.getBookList(publishedDate, list);
    return mBookListDao
        .getAllBooksListEventStream()
        .startWith(mBookListDao.getAllBooksListStream())
        .combineLatest(mBookListDao.getAllBooksListStream(),
            (event, BookResultList) => BookResultList as List<BookListResultVO>)
        .first;
  }

  @override
  Future<List<BookSearchItemsVO>> getSearchBookFromDatabase(String q) {
    return mSearchBookDao
        .getAllBookSearchItemEventStream()
        .startWith(mSearchBookDao.getAllBookSearchItemListStream())
        .combineLatest(
            mSearchBookDao.getAllBookSearchItemListStream(),
            (event, BookSearchItemsList) =>
                BookSearchItemsList as List<BookSearchItemsVO>)
        .first;
  }

  @override
  Future<BookOverviewListVO> getBookDetailsFromDatabase(int listId) {
    return mBookOverviewDao
        .getAllBooksOverviewEventStream()
        .startWith(mBookOverviewDao.getBookDetailStream(listId))
        .combineLatest(mBookOverviewDao.getBookDetailStream(listId),
            (event, BookDetails) => BookDetails as BookOverviewListVO)
        .first;
  }

  @override
  void setBookDetailsToDatabase(BooksVO book) {
    mBookDetailDao.saveAllBookDetail(book);
  }

  @override
  Future<List<BooksVO>> getAllBookDetailListFromDatabase(){
    return Future.value(mBookDetailDao.getAllBookDetailList());
  }
}
