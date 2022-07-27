import 'package:flutter/material.dart';
import 'package:google_play_books_app/data/vos/book_overview_list_vo.dart';
import 'package:google_play_books_app/data/vos/book_search_items_vo.dart';
import 'package:google_play_books_app/data/vos/books_vo.dart';
import 'package:google_play_books_app/resources/colors.dart';
import 'package:google_play_books_app/resources/dimens.dart';
import 'package:google_play_books_app/widgets/modal_bottom_sheet_list_title_view.dart';

class BookListView extends StatelessWidget {
  final BookOverviewListVO mBookOverviewList;
  final Function(String) onTapButton;
  final Function(int, int) onTapBook;

  BookListView(this.mBookOverviewList, this.onTapButton, this.onTapBook);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: PRIMARY_COLOR,
          child: Row(
            children: [
              Container(
                child: Text(
                   mBookOverviewList.displayName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: TEXT_REGULAR_2X,
                  ),
                ),
              ),
              Spacer(),
              Container(
                child: GestureDetector(
                  onTap: () {
                    onTapButton(mBookOverviewList.listNameEncoded);
                  },
                  child: Icon(
                    Icons.chevron_right,
                    color: SELECTED_TEXT_COLOR,
                    size: MARGIN_XLARGE,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM),
        Container(
          height: BOOK_LIST_ITEM_HEIGHT,
          color: PRIMARY_COLOR,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: this.mBookOverviewList.books.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  this.onTapBook(this.mBookOverviewList.listId, index);
                },
                child: Container(
                  width: BOOK_LIST_ITEM_WIDTH,
                  child: EBookAndAudioBookItemView(
                      this.mBookOverviewList.books[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class EBookAndAudioBookItemView extends StatelessWidget {
  final BooksVO book;

  EBookAndAudioBookItemView(this.book);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Align(
              child: Image.network(
                this.book.bookImage ?? "",
                height: BOOK_IMAGE_HEIGHT_FOR_HOME,
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
          this.book.title,
          style: TextStyle(
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: MARGIN_SMALL),
        Text(
          this.book.author,
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