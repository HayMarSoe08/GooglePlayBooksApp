import 'package:flutter/material.dart';
import 'package:google_play_books_app/resources/dimens.dart';
import 'package:google_play_books_app/resources/strings.dart';
import 'package:google_play_books_app/widgets/library_modal_bottom_sheet_view.dart';
import 'package:google_play_books_app/widgets/modal_bottom_sheet_list_title_view.dart';
import 'package:google_play_books_app/widgets/shelves_modal_bottom_sheet_view.dart';

class ViewAsListView extends StatelessWidget {
  final String callPage;

  final Function onTapAddToShelf;

  ViewAsListView(this.callPage, this.onTapAddToShelf);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 12,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: SHEIVES_IMAGE_HEIGHT,
                  margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                  child: Row(
                    children: [
                      Image.network(
                        "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1545854312l/12609433._SY475_.jpg",
                        height: SHEIVES_IMAGE_HEIGHT,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: MARGIN_MEDIUM_3),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "The Power of Habit",
                                  style: TextStyle(
                                    fontSize: TEXT_REGULAR_X,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: MARGIN_SMALL),
                                Text(
                                  "Charles Duhigg",
                                  style: TextStyle(
                                    fontSize: TEXT_REGULAR,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: MARGIN_SMALL),
                                Text(
                                  "Ebook . Sample",
                                  style: TextStyle(
                                    fontSize: TEXT_REGULAR,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: MARGIN_XLARGE),
                      Container(
                        margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
                        child: Icon(
                          Icons.download_done_outlined,
                          color: Colors.black54,
                          size: MARGIN_LARGE,
                        ),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  if (this.callPage == LIBRARY_PAGE_NAME) {
                                    return LibraryModalBottomSheetView(this.onTapAddToShelf);
                                  } else {
                                    return ShelvesModalBottomSheetView(this.onTapAddToShelf);
                                  }
                                });
                          },
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.black54,
                            size: MARGIN_XLARGE,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MARGIN_MEDIUM_2),
            ],
          ),
        );
      },
    );
  }
}
