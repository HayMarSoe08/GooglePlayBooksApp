import 'package:dio/dio.dart';
import 'package:google_play_books_app/network/responses/search_book_response.dart';
import 'package:retrofit/retrofit.dart';

import 'api_constants.dart';

part 'search_api.g.dart';

@RestApi(baseUrl: BASE_URL_FOR_SEARCH_DIO)
abstract class SearchApi {

  factory SearchApi(Dio dio) =_SearchApi;

  @GET(ENDPOINT_GET_SEARCH_BOOK)
  Future<SearchBookResponse> getSearchBook(
      @Query(PARAM_Q) String q,
      );

}