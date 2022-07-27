import 'package:dio/dio.dart';
import 'package:google_play_books_app/data/vos/book_list_result_vo.dart';
import 'package:google_play_books_app/data/vos/book_overview_list_vo.dart';
import 'package:google_play_books_app/data/vos/book_overview_result_vo.dart';
import 'package:google_play_books_app/data/vos/book_search_items_vo.dart';
import 'package:google_play_books_app/network/book_api.dart';
import 'package:google_play_books_app/network/dataagents/library_data_agent.dart';
import 'package:google_play_books_app/network/responses/book_list_response.dart';
import 'package:google_play_books_app/network/responses/book_overview_response.dart';
import 'package:google_play_books_app/network/search_api.dart';

import '../api_constants.dart';

class RetrofitDataAgentImpl extends LibraryDataAgent {
  BookApi? mBookApi;
  SearchApi? mSearchApi;

  static final RetrofitDataAgentImpl _singleton =
      RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl() {
    return _singleton;
  }

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    mBookApi = BookApi(dio);
    mSearchApi = SearchApi(dio);
  }

  @override
  Future<BookOverviewResultVO?> getBookOverview(
    String publishedDate
  ) {
    return mBookApi!
        .getBookOverview(API_KEY, publishedDate)
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<BookListResultVO>> getBookList(
    String publishedDate,
    String list,
  ) {
    return mBookApi!
        .getBookList(API_KEY, publishedDate, list)
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<BookSearchItemsVO?>?> getSearchBook(
    String q,
  ) {
    return mSearchApi!
        .getSearchBook(q)
        .asStream()
        .map((response) => response.items)
        .first;
  }
}
