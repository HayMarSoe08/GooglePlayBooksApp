import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_play_books_app/pages/add_to_shelves_page.dart';
import 'package:google_play_books_app/pages/search_page.dart';
import 'package:google_play_books_app/pages/shelves_details_page.dart';
import 'package:google_play_books_app/resources/colors.dart';
import 'package:google_play_books_app/resources/dimens.dart';
import 'package:google_play_books_app/resources/strings.dart';
import 'package:google_play_books_app/widgets/search_bar_view.dart';
import 'package:google_play_books_app/widgets/your_books_view.dart';

import 'create_shelf_page.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: MARGIN_XLARGE,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SearchBarView(() => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()))),
              BooksAndShelvesView(
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShelvesDetailsPage())),
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateShelfPage())),
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddToShelvesPage()))),
            ],
          ),
        ),
      ),
    );
  }
}

class BooksAndShelvesView extends StatelessWidget {
  final Function onTapButton;
  final Function onTapCreateButton;
  final Function onTapAddToShelf;

  BooksAndShelvesView(
      this.onTapButton, this.onTapCreateButton, this.onTapAddToShelf);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: BOOK_LIST_HEIGHT,
      color: PRIMARY_COLOR,
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: PRIMARY_COLOR,
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
                    child: Text('Your books')),
                Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text('Your sheives')),
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              YourBooksView(LIBRARY_PAGE_NAME, this.onTapAddToShelf),
              YourShelvesView(this.onTapButton, this.onTapCreateButton),
            ],
          ),
        ),
      ),
    );
  }
}

class YourShelvesView extends StatelessWidget {
  final Function onTapButton;
  final Function onTapCreateButton;

  YourShelvesView(this.onTapButton, this.onTapCreateButton);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.68,
              child: ListView.builder(
                itemCount: 12,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            this.onTapButton();
                          },
                          child: Container(
                            height: SHEIVES_IMAGE_HEIGHT,
                            margin: EdgeInsets.symmetric(
                                horizontal: MARGIN_MEDIUM_2),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "My book",
                                            style: TextStyle(
                                              fontSize: TEXT_REGULAR_2X,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: MARGIN_MEDIUM),
                                          Text(
                                            "1 book",
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
                                Spacer(),
                                Container(
                                  margin:
                                      EdgeInsets.only(right: MARGIN_MEDIUM_2),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: Colors.black54,
                                    size: MARGIN_XLARGE,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(thickness: 2),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                this.onTapCreateButton();
              },
              child: Container(
                margin: EdgeInsets.only(bottom: MARGIN_MEDIUM_2),
                padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
                height: MARGIN_XXLARGE,
                width: CREATE_NEW_BUTTON_WIDTH,
                decoration: BoxDecoration(
                  color: CREATE_NEW_BUTTON_COLOR,
                  borderRadius: BorderRadius.circular(MARGIN_MEDIUM_3),
                  border: Border.all(
                    color: Colors.white,
                    width: BORDER_WIDTH_SMALL,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    SizedBox(width: MARGIN_SMALL),
                    Text(
                      'Create new',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
