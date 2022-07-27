import 'package:flutter/material.dart';
import 'package:google_play_books_app/blocs/book_list_by_name_bloc.dart';
import 'package:google_play_books_app/blocs/home_bloc.dart';
import 'package:google_play_books_app/data/vos/book_list_result_vo.dart';
import 'package:google_play_books_app/resources/colors.dart';
import 'package:google_play_books_app/resources/dimens.dart';
import 'package:google_play_books_app/widgets/modal_bottom_sheet_list_title_view.dart';
import 'package:provider/provider.dart';

class BookListPage extends StatelessWidget {
  String listNameEncoded;

  BookListPage(this.listNameEncoded);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookListByNameBloc(listNameEncoded),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Selector<BookListByNameBloc, List<BookListResultVO>>(
            selector: (context, bloc) => bloc.mBookResultList,
            builder: (context, bookList, child) => Container(
              color: PRIMARY_COLOR,
              child: Column(
                children: [
                  SizedBox(height: MARGIN_MEDIUM),
                  TitleView(() => Navigator.pop(context), listNameEncoded),
                  BooksGridView(bookList),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TitleView extends StatelessWidget {
  final Function onTapButton;
  final String listValue;

  TitleView(this.onTapButton, this.listValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      margin: EdgeInsets.only(
        left: MARGIN_SMALL,
        top: MARGIN_XLARGE,
        right: MARGIN_MEDIUM,
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
            child: GestureDetector(
              onTap: () {
                this.onTapButton();
              },
              child: Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: MARGIN_XLARGE,
              ),
            ),
          ),
          SizedBox(width: MARGIN_MEDIUM),
          Container(
            margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
            child: Text(
              listValue,
              style: TextStyle(
                color: Colors.black,
                fontSize: TEXT_REGULAR_2X,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BooksGridView extends StatelessWidget {
  final List<BookListResultVO> mBookList;

  BooksGridView(this.mBookList);

  @override
  Widget build(BuildContext context) {
    return this.mBookList.isNotEmpty
        ? Container(
            margin: EdgeInsets.only(
              right: MARGIN_MEDIUM_2,
            ),
            height: (MediaQuery.of(context).size.height * 0.9),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: MARGIN_MEDIUM_2,
                  ),
                  child: BookItemView(
                    this.mBookList[index],
                  ),
                );
              },
            ),
          )
        : Container();
  }
}

class BookItemView extends StatelessWidget {
  final BookListResultVO mBook;

  BookItemView(this.mBook);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Align(
              child: Image.network(
                this.mBook.amazonProductUrl,
                height: BOOK_IMAGE_HEIGHT_FOR_LARGE_GRID,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MARGIN_MEDIUM,
                  right: MARGIN_MEDIUM,
                ),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return HomePageShowModalBottomSheetView();
                        });
                  },
                  child: Icon(
                    Icons.more_horiz,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: MARGIN_MEDIUM),
        Text(
          this.mBook.bookDetails[0].title,
          style: TextStyle(
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: MARGIN_SMALL),
        Text(
          this.mBook.bookDetails[0].author,
          style: TextStyle(
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class HomePageShowModalBottomSheetView extends StatelessWidget {
  const HomePageShowModalBottomSheetView({
    Key? key,
  }) : super(key: key);

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
        Divider(thickness: 2),
        ModalBottomSheetListTitleView(
            Icons.add_to_photos_outlined, "Free sample"),
        ModalBottomSheetListTitleView(Icons.description, "About this book'"),
      ],
    );
  }
}
