import 'package:flutter/material.dart';
import 'package:google_play_books_app/resources/dimens.dart';

import 'modal_bottom_sheet_list_title_view.dart';

class LibraryModalBottomSheetView extends StatelessWidget {
  final Function onTapAddToShelf;

  LibraryModalBottomSheetView(this.onTapAddToShelf);

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
                height: SHOW_MODAL_LARGE_HEIGHT,
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
            Icons.remove_circle_outline_rounded, "Remove download"),
        ModalBottomSheetListTitleView(Icons.delete, "Delete from your library"),
        ModalBottomSheetListTitleView(Icons.add, "Add to shelves...", onTapButton: this.onTapAddToShelf),
        ModalBottomSheetListTitleView(Icons.description, "About this book'"),
      ],
    );
  }
}
