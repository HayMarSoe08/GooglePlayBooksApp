import 'package:flutter/material.dart';
import 'package:google_play_books_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_play_books_app/pages/main_screen.dart';

import 'data/vos/book_details_vo.dart';
import 'data/vos/book_list_result_vo.dart';
import 'data/vos/book_overview_list_vo.dart';
import 'data/vos/book_overview_result_vo.dart';
import 'data/vos/book_search_items_vo.dart';
import 'data/vos/books_vo.dart';
import 'data/vos/buylinks_vo.dart';
import 'data/vos/image_link_vo.dart';
import 'data/vos/isbns_vo.dart';
import 'data/vos/reviews_vo.dart';
import 'data/vos/volume_info_vo.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(BookDetailsVOAdapter());
  Hive.registerAdapter(BookListResultVOAdapter());
  Hive.registerAdapter(BookOverviewListVOAdapter());
  Hive.registerAdapter(BookOverviewResultVOAdapter());
  Hive.registerAdapter(BookSearchItemsVOAdapter());
  Hive.registerAdapter(BooksVOAdapter());
  Hive.registerAdapter(BuyLinksVOAdapter());
  Hive.registerAdapter(ImageLinkVOAdapter());
  Hive.registerAdapter(IsbnsVOAdapter());
  Hive.registerAdapter(ReviewsVOAdapter());
  Hive.registerAdapter(VolumeInfoVOAdapter());

  await Hive.openBox<BookOverviewListVO>(BOX_NAME_BOOK_OVERVIEW_LIST_VO);
  await Hive.openBox<BookListResultVO>(BOX_NAME_BOOK_LIST_RESULT_VO);
  await Hive.openBox<BookSearchItemsVO>(BOX_NAME_BOOK_SEARCH_ITEMS_VO);
  await Hive.openBox<BooksVO>(BOX_NAME_BOOK_LIST_SAVE_TO_HIVE_VO);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
