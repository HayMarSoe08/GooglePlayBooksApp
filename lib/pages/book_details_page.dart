import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_play_books_app/blocs/book_details_bloc.dart';
import 'package:google_play_books_app/data/vos/book_overview_list_vo.dart';
import 'package:google_play_books_app/data/vos/books_vo.dart';
import 'package:google_play_books_app/resources/colors.dart';
import 'package:google_play_books_app/resources/dimens.dart';
import 'package:google_play_books_app/resources/strings.dart';
import 'package:google_play_books_app/widgets/book_detail_view.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class BookDetailsPage extends StatelessWidget {
  int listId;
  int index;

  BookDetailsPage(this.listId, this.index);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookDetailsBloc(this.listId),
      child: Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: SingleChildScrollView(
          child: Selector<BookDetailsBloc, BookOverviewListVO>(
            selector: (context, bloc) => bloc.mBookDetail!,
            builder: (context, bookDetail, child) => Container(
              child: Column(
                children: [
                  TitleView(
                      () =>  Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage())), bookDetail.displayName),
                  BookDetailsView(bookDetail.books[index]),
                  SizedBox(height: MARGIN_MEDIUM_2),
                  Divider(thickness: 2),
                  SizedBox(height: MARGIN_MEDIUM_2),
                  ButtonView(),
                  SizedBox(height: MARGIN_MEDIUM_2),
                  Divider(thickness: 2),
                  RatingView(bookDetail.books[index]),
                  BookDescriptionView(bookDetail.books[index]),
                  SizedBox(height: MARGIN_MEDIUM_2),
                  BookPublishedView(bookDetail, index),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BookPublishedView extends StatelessWidget {
  final BookOverviewListVO bookDetail;
  final int index;

  BookPublishedView(this.bookDetail, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        left: MARGIN_MEDIUM_2,
        top: MARGIN_XLARGE,
        right: MARGIN_MEDIUM_2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Published",
            style: TextStyle(
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM),
          Text(
            "${this.bookDetail.publishedDate ?? ""}${". "}${this.bookDetail.books[index].publisher ?? ""}",
            style: TextStyle(
              fontSize: TEXT_REGULAR_X,
            ),
          ),
        ],
      ),
    );
  }
}

class BookDescriptionView extends StatelessWidget {
  final BooksVO bookDetail;

  BookDescriptionView(this.bookDetail);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        left: MARGIN_MEDIUM_2,
        top: MARGIN_XLARGE,
        right: MARGIN_MEDIUM_2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Descripton",
            style: TextStyle(
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM),
          Text(
            this.bookDetail.description,
            style: TextStyle(
              fontSize: TEXT_REGULAR_X,
            ),
          ),
        ],
      ),
    );
  }
}

class RatingView extends StatelessWidget {
  final BooksVO bookDetail;

  RatingView(this.bookDetail);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: MARGIN_MEDIUM_2,
        top: MARGIN_MEDIUM_2,
        right: MARGIN_MEDIUM_2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                Text(
                  this.bookDetail.rank.toString(),
                  style: TextStyle(
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: MARGIN_SMALL),
                RatingBar.builder(
                    initialRating:
                        double.parse(this.bookDetail.rank.toString()),
                    itemBuilder: (BuildContext context, int index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                    itemSize: MARGIN_MEDIUM_2,
                    onRatingUpdate: (rating) {
                      print(rating);
                    }),
              ],
            ),
          ),
          SizedBox(height: MARGIN_SMALL),
          Text(
            "691 raging on Google Play",
            style: TextStyle(
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}

class ButtonView extends StatelessWidget {
  const ButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
              height: MARGIN_XXLARGE,
              decoration: BoxDecoration(
                color: CREATE_NEW_BUTTON_COLOR,
                borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
                border: Border.all(
                  color: Colors.white,
                  width: BORDER_WIDTH_SMALL,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      FREE_SAMPLE_BUTTON_TEXT,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: TEXT_REGULAR_X,
                      ),
                    ),
                  ),
                ],
              )),
          SizedBox(height: MARGIN_SMALL),
          Container(
              margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
              height: MARGIN_XXLARGE,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
                border: Border.all(
                  color: CHIP_BORDER_TEXT_COLOR,
                  width: BORDER_WIDTH_SMALL,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      GET_THE_FULL_BOOK_BUTTON_TEXT,
                      style: TextStyle(
                        color: CREATE_NEW_BUTTON_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: TEXT_REGULAR_X,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class TitleView extends StatelessWidget {
  final Function onTapButton;
  final String displayName;

  TitleView(this.onTapButton, this.displayName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: MARGIN_SMALL,
        top: MARGIN_XLARGE,
        right: MARGIN_MEDIUM_2,
      ),
      color: PRIMARY_COLOR,
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
              this.displayName,
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
