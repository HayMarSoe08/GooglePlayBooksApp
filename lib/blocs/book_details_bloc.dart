import 'package:flutter/foundation.dart';
import 'package:google_play_books_app/data/models/library_model.dart';
import 'package:google_play_books_app/data/models/library_model_impl.dart';
import 'package:google_play_books_app/data/vos/book_overview_list_vo.dart';

class BookDetailsBloc extends ChangeNotifier {

  /// States
  BookOverviewListVO? mBookDetail;

  ///Model
  LibraryModel mLibraryModel = LibraryModelImpl();

  BookDetailsBloc(int listId) {
    /// Book Details
    mLibraryModel.getBookDetailsFromDatabase(listId).then((bookDetail) {
      mBookDetail = bookDetail;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }
}