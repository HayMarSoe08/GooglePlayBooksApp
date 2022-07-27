import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'api_constants.dart';
import 'responses/book_list_response.dart';
import 'responses/book_overview_response.dart';

part 'book_api.g.dart';

@RestApi(baseUrl: BASE_URL_FOR_BOOK_DIO)
abstract class BookApi {

  factory BookApi(Dio dio) =_BookApi;

  @GET(ENDPOINT_GET_BOOK_OVERVIEW)
  Future<BookOverviewResponse> getBookOverview(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_PUBLISHED_DATE) String publishedDate,
      );

  @GET(ENDPOINT_GET_BOOK_LIST)
  Future<BookListResponse> getBookList(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_PUBLISHED_DATE) String publishedDate,
      @Query(PARAM_LIST) String list,
      );
}