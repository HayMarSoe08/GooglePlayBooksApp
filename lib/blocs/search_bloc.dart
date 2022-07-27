import 'package:flutter/foundation.dart';
import 'package:google_play_books_app/data/models/library_model.dart';
import 'package:google_play_books_app/data/models/library_model_impl.dart';
import 'package:google_play_books_app/data/vos/book_search_items_vo.dart';

class SearchBloc extends ChangeNotifier {
  List<BookSearchItemsVO> mSearchItemList = [];

  ///Model
  LibraryModel mLibraryModel = LibraryModelImpl();

  String searchData = "";
  bool isVisibleCloseButton = false;

  void checkData() {
    if (searchData.isNotEmpty) {
      isVisibleCloseButton = true;
    } else {
      isVisibleCloseButton = false;
    }
    notifyListeners();
  }

  void searchBook(String data) {
    /// Book Search Item List
    mLibraryModel.getSearchBookFromDatabase(data).then((searchItemList) {
      mSearchItemList = searchItemList;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }
}
