import 'package:flutter/material.dart';
import 'package:google_play_books_app/resources/colors.dart';
import 'package:google_play_books_app/resources/dimens.dart';

class AddToShelvesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              TitleView(() => Navigator.pop(context)),
              ShelfListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class ShelfListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.68,
      child: ListView.builder(
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              children: [
                Container(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                        margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
                        child: Checkbox(
                          checkColor: Colors.black,
                          value: false,
                          onChanged: (bool? value) {

                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(thickness: 2),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TitleView extends StatelessWidget {
  final Function onTapButton;

  TitleView(this.onTapButton);

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
            width: MediaQuery.of(context).size.width * 0.88,
            child: Center(
              child: Text(
                "Add to shelves",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: TEXT_REGULAR_2X,
                ),
              ),
              
            ),
          ),
          Spacer(),
          Container(
            child: GestureDetector(
              onTap: () {
                this.onTapButton();
              },
              child: Icon(
                Icons.close,
                color: Colors.black,
                size: MARGIN_LARGE,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
