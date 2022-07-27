import 'package:flutter/foundation.dart';
import 'package:google_play_books_app/data/models/library_model.dart';
import 'package:google_play_books_app/data/models/library_model_impl.dart';
import 'package:google_play_books_app/data/vos/book_list_result_vo.dart';
import 'package:intl/intl.dart';

class BookListByNameBloc extends ChangeNotifier{
  List<BookListResultVO> mBookResultList = [];

  ///Model
  LibraryModel mLibraryModel = LibraryModelImpl();

  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());

  BookListByNameBloc(String listNameEncoded) {
    mLibraryModel.getBookListFromDatabase(now, listNameEncoded).then((bookResultList) {
      mBookResultList = bookResultList;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }
}