import 'package:flutter/material.dart';
import 'package:google_play_books_app/data/vos/book_overview_list_vo.dart';
import 'package:google_play_books_app/data/vos/books_vo.dart';
import 'package:google_play_books_app/resources/dimens.dart';

class BookDetailsView extends StatelessWidget {
  final BooksVO bookDetail;


  BookDetailsView(this.bookDetail);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: BOOK_IMAGE_HEIGHT_FOR_HOME,
      margin: EdgeInsets.only(
        left: MARGIN_MEDIUM_2,
        top: MARGIN_XLARGE,
        right: MARGIN_MEDIUM_2,
      ),
      child: Row(
        children: [
          Image.network(
            bookDetail.bookImage,
            height: BOOK_IMAGE_HEIGHT_FOR_HOME,
            width: 100.0,
            fit: BoxFit.fill,
          ),
          SizedBox(width: MARGIN_MEDIUM_2),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookDetail.title,
                  style: TextStyle(
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: MARGIN_SMALL),
                Text(
                  bookDetail.author,
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
  }
}