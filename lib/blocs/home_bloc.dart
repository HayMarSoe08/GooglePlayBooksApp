import 'package:flutter/foundation.dart';
import 'package:google_play_books_app/data/models/library_model.dart';
import 'package:google_play_books_app/data/models/library_model_impl.dart';
import 'package:google_play_books_app/data/vos/book_overview_list_vo.dart';
import 'package:google_play_books_app/data/vos/books_vo.dart';
import 'package:intl/intl.dart';

class HomeBloc extends ChangeNotifier {
  /// States
  List<BookOverviewListVO> mBookOverviewList = [];
  List<BooksVO> mBookDetailList = [];

  int viewStyle = 1;
  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());

  ///Model
  LibraryModel mLibraryModel = LibraryModelImpl();

  HomeBloc() {
    /// Book Overview List
    mLibraryModel.getBookOverviewFromDatabase(now).then((bookOverviewList) {
      mBookOverviewList = bookOverviewList;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });

    // Book Details List
    mLibraryModel.getAllBookDetailListFromDatabase().then((bookList) {
      mBookDetailList = bookList;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  void saveBookDetailsToDatabase(BooksVO book) {
    mLibraryModel.setBookDetailsToDatabase(book);
  }

  void setViewStyle(int val) {
    viewStyle = val;
    notifyListeners();
  }
}
