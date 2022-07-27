import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_play_books_app/blocs/home_bloc.dart';
import 'package:google_play_books_app/data/vos/book_overview_list_vo.dart';
import 'package:google_play_books_app/data/vos/books_vo.dart';
import 'package:google_play_books_app/pages/search_page.dart';
import 'package:google_play_books_app/resources/colors.dart';
import 'package:google_play_books_app/resources/dimens.dart';
import 'package:google_play_books_app/widgets/book_list_view.dart';
import 'package:google_play_books_app/widgets/book_list_view_audio.dart';
import 'package:google_play_books_app/widgets/modal_bottom_sheet_list_title_view.dart';
import 'package:google_play_books_app/widgets/search_bar_view.dart';
import 'package:provider/provider.dart';

import 'add_to_shelves_page.dart';
import 'book_details_page.dart';
import 'book_list_page.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: SingleChildScrollView(
          child: Container(
            color: PRIMARY_COLOR,
            margin: EdgeInsets.only(
              top: MARGIN_XLARGE,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SearchBarView(() => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()))),
                Selector<HomeBloc, List<BooksVO>>(
                  selector: (context, bloc) => bloc.mBookDetailList,
                  builder: (context, bookDetailsList, child) =>
                      CarouselSliderView(
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddToShelvesPage())),
                    bookDetailsList,
                  ),
                ),
                Selector<HomeBloc, List<BookOverviewListVO>>(
                  selector: (context, bloc) => bloc.mBookOverviewList,
                  builder: (context, bookOverviewList, child) =>
                      EBookAndAudioBookView((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookListPage(value)));
                  }, (listId, index) {
                    HomeBloc bloc =
                        Provider.of<HomeBloc>(context, listen: false);
                    _navigateToBookDetailPage(
                        context, bloc, bookOverviewList, listId, index);
                  }, bookOverviewList),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToBookDetailPage(BuildContext context, HomeBloc bloc,
      List<BookOverviewListVO> bookOverViewList, int listId, int index) {
    bloc.saveBookDetailsToDatabase(bookOverViewList
        .where((element) => element.listId == listId)
        .first
        .books[index]);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BookDetailsPage(listId, index)));
  }
}

class EBookAndAudioBookView extends StatelessWidget {
  final Function(String) onTapButton;
  final Function(int, int) onTapBook;
  final List<BookOverviewListVO> mBookOverviewList;

  EBookAndAudioBookView(
      this.onTapButton, this.onTapBook, this.mBookOverviewList);

  @override
  Widget build(BuildContext context) {
    return this.mBookOverviewList.isNotEmpty
        ? Container(
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
                          itemCount: this.mBookOverviewList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return BookListView(mBookOverviewList[index],
                                this.onTapButton, this.onTapBook);
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
          )
        : Container();
  }
}

class CarouselSliderView extends StatelessWidget {
  final Function onTapAddToShelf;
  final List<BooksVO> bookList;

  CarouselSliderView(this.onTapAddToShelf, this.bookList);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        top: MARGIN_MEDIUM_2,
        left: MARGIN_MEDIUM_2,
        right: MARGIN_MEDIUM_2,
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: false,
          aspectRatio: 1.7,
          enlargeCenterPage: true,
        ),
        items: bookList
            .map(
              (book) => Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      book.bookImage,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: MARGIN_MEDIUM),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return ShowModalBottomSheetView(
                                      this.onTapAddToShelf);
                                });
                          },
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: MARGIN_SMALL),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(MARGIN_SMALL),
                            border: Border.all(
                              color: Colors.white,
                              width: BORDER_WIDTH_SMALL,
                            ),
                          ),
                          child: Icon(
                            Icons.headset,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: MARGIN_SMALL),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(MARGIN_SMALL),
                            border: Border.all(
                              color: Colors.white,
                              width: BORDER_WIDTH_SMALL,
                            ),
                          ),
                          child: Icon(
                            Icons.download_done_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MARGIN_MEDIUM),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class ShowModalBottomSheetView extends StatelessWidget {
  final Function onTapAddToShelf;

  ShowModalBottomSheetView(this.onTapAddToShelf);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: SHOW_MODAL_LARGE_HEIGHT,
          margin: EdgeInsets.all(MARGIN_MEDIUM_2),
          child: Row(
            children: [
              Image.network(
                "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1545854312l/12609433._SY475_.jpg",
                height: CHIP_LIST_ITEM_HEIGHT,
                fit: BoxFit.fill,
              ),
              SizedBox(width: MARGIN_MEDIUM_2),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "HABIT",
                      style: TextStyle(
                        fontSize: TEXT_REGULAR_3X,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: MARGIN_SMALL),
                    Text(
                      "Carol Leonnig",
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
        ),
        Container(
          height: 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
            border: Border.all(
              color: Colors.black,
            ),
          ),
        ),
        ModalBottomSheetListTitleView(
            Icons.remove_circle_outline_rounded, "Remove download"),
        ModalBottomSheetListTitleView(Icons.delete, "Delete from your library"),
        GestureDetector(
          onTap: () {
            this.onTapAddToShelf();
          },
          child: ModalBottomSheetListTitleView(Icons.add, "Add to shelves..."),
        ),
        ModalBottomSheetListTitleView(Icons.description, "About this book'"),
      ],
    );
  }
}
