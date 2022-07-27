import 'package:flutter/material.dart';
import 'package:google_play_books_app/resources/dimens.dart';
import 'package:google_play_books_app/resources/strings.dart';
import 'package:google_play_books_app/widgets/library_modal_bottom_sheet_view.dart';
import 'package:google_play_books_app/widgets/modal_bottom_sheet_list_title_view.dart';
import 'package:google_play_books_app/widgets/shelves_modal_bottom_sheet_view.dart';

class ViewAsLargeGridView extends StatelessWidget {
  final String callPage;
  final Function onTapAddToShelf;

  ViewAsLargeGridView(this.callPage, this.onTapAddToShelf);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(
            left: MARGIN_MEDIUM,
            top: MARGIN_MEDIUM,
            right: MARGIN_MEDIUM,
          ),
          child: BookItemView(
              "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1545854312l/12609433._SY475_.jpg",
              this.callPage,
              this.onTapAddToShelf),
        );
      },
    );
  }
}

class BookItemView extends StatelessWidget {
  final String image;
  final String callPage;
  final Function onTapAddToShelf;

  BookItemView(this.image, this.callPage, this.onTapAddToShelf);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Align(
              child: Image.network(
                this.image,
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
                          if (this.callPage == LIBRARY_PAGE_NAME) {
                            return LibraryModalBottomSheetView(
                                this.onTapAddToShelf);
                          } else {
                            return ShelvesModalBottomSheetView(this.onTapAddToShelf);
                          }
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
          "Zero Fail",
          style: TextStyle(
            fontSize: TEXT_REGULAR,
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
      ],
    );
  }
}
