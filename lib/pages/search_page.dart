import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_play_books_app/blocs/search_bloc.dart';
import 'package:google_play_books_app/data/vos/book_search_items_vo.dart';
import 'package:google_play_books_app/resources/colors.dart';
import 'package:google_play_books_app/resources/dimens.dart';
import 'package:google_play_books_app/widgets/book_list_view_audio.dart';
import 'package:provider/provider.dart';

import 'book_details_page.dart';
import 'book_list_page.dart';

class SearchPage extends StatelessWidget {
  final _deBouncer = DeBouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchBloc(),
      child: Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: SingleChildScrollView(
          child: Selector<SearchBloc, List<BookSearchItemsVO>>(
            selector: (context, bloc) => bloc.mSearchItemList,
            builder: (context, searchItemList, child) => Container(
              child: Column(
                children: [
                  Divider(thickness: 2),
                  BookSearchBarView((value) => _deBouncer.run(() {
                        SearchBloc bloc = Provider.of<SearchBloc>(context, listen: false);
                        bloc.searchBook(value);
                        print(value);
                      })),
                  searchItemList.isNotEmpty
                      ? SuggestionBookView(searchItemList)
                      : Container(),
                  searchItemList.isNotEmpty
                      ? SearchResultView(
                          (value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookListPage(value))),
                          (listId, index) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BookDetailsPage(listId, index))),
                          searchItemList)
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DeBouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;
  DeBouncer({required this.milliseconds});
  run(VoidCallback action) async {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class SuggestionBookView extends StatelessWidget {
  final List<BookSearchItemsVO> mSearchItemList;

  SuggestionBookView(this.mSearchItemList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: BOOK_IMAGE_HEIGHT_FOR_SEARCH,
            margin: EdgeInsets.only(
              left: MARGIN_MEDIUM_2,
              bottom: MARGIN_MEDIUM_2,
              right: MARGIN_MEDIUM_2,
            ),
            child: Row(
              children: [
                Image.network(
                  this.mSearchItemList[index].volumeInfo.imageLinks.thumbnail,
                  height: BOOK_IMAGE_HEIGHT_FOR_SEARCH,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: MARGIN_MEDIUM_2),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        this.mSearchItemList[index].volumeInfo.title,
                        style: TextStyle(
                          fontSize: TEXT_REGULAR_2X,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: MARGIN_SMALL),
                      Text(
                        this
                                .mSearchItemList[index]
                                .volumeInfo
                                .authors
                                .isNotEmpty
                            ? this
                                .mSearchItemList[index]
                                .volumeInfo
                                .authors
                                .map((e) => e)
                                .join(", ")
                            : "-",
                        style: TextStyle(
                          fontSize: TEXT_REGULAR,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: MARGIN_SMALL),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Ebook .",
                              style: TextStyle(
                                fontSize: TEXT_REGULAR,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: MARGIN_SMALL),
                            Text(
                              "320 Pages",
                              style: TextStyle(
                                fontSize: TEXT_REGULAR,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BookSearchBarView extends StatelessWidget {
  final Function(String) onTextChange;

  BookSearchBarView(this.onTextChange);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchBloc(),
      child: Container(
        margin: EdgeInsets.only(
          left: MARGIN_SMALL,
          top: MARGIN_XLARGE,
          right: MARGIN_MEDIUM_2,
        ),
        color: PRIMARY_COLOR,
        child: Row(
          children: [
            Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                  size: MARGIN_XLARGE,
                ),
              ),
            ),
            SizedBox(width: MARGIN_SMALL),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Search Play Books',
                  ),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    this.onTextChange(value);
                    SearchBloc bloc =
                        Provider.of<SearchBloc>(context, listen: false);
                    bloc.searchData = value;
                    bloc.checkData();
                  },
                ),
              ),
            ),
            Spacer(),
            Selector<SearchBloc, bool>(
              selector: (context, bloc) => bloc.isVisibleCloseButton,
              builder: (context, isVisibleCloseButton, child) =>
                  isVisibleCloseButton == true
                      ? Container(
                          child: Icon(
                            Icons.close,
                          ),
                        )
                      : Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchResultView extends StatelessWidget {
  final Function(String) onTapButton;
  final Function(int, int) onTapBook;
  final List<BookSearchItemsVO> mSearchItemList;

  SearchResultView(this.onTapButton, this.onTapBook, this.mSearchItemList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: PRIMARY_COLOR,
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: PRIMARY_COLOR,
            automaticallyImplyLeading: false,
            title: TabBar(
              labelColor: SELECTED_TEXT_COLOR,
              unselectedLabelColor: Colors.black,
              tabs: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text('Ebooks')),
                Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text('Audiobooks')),
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                color: PRIMARY_COLOR,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return BookListViewAudio(
                          "More like I Alone Can Fix It",
                          "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1545854312l/12609433._SY475_.jpg",
                          this.onTapButton,
                          this.onTapBook);
                    }),
              ),
              Container(
                color: PRIMARY_COLOR,
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return BookListViewAudio(
                          "More like I Alone Can Fix It",
                          "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1545854312l/12609433._SY475_.jpg",
                          this.onTapButton,
                          this.onTapBook);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
