import 'package:flutter/material.dart';
import 'package:google_play_books_app/pages/add_to_shelves_page.dart';
import 'package:google_play_books_app/resources/colors.dart';
import 'package:google_play_books_app/resources/dimens.dart';
import 'package:google_play_books_app/resources/strings.dart';
import 'package:google_play_books_app/widgets/modal_bottom_sheet_list_title_view.dart';
import 'package:google_play_books_app/widgets/your_books_view.dart';

class ShelvesDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              TitleView(() => Navigator.pop(context)),
              SizedBox(height: MARGIN_MEDIUM_2),
              Container(
                margin: EdgeInsets.only(left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My book",
                      style: TextStyle(
                        fontSize: TEXT_REGULAR_3X,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: MARGIN_SMALL),
                    Text(
                      "1 book",
                      style: TextStyle(
                        fontSize: TEXT_REGULAR_X,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MARGIN_MEDIUM_2),
              Container(
                height: 1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: MARGIN_MEDIUM_2),
              YourBooksView(SHELF_DETAILS_PAGE_NAME,
                      () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddToShelvesPage()))),
            ],
          ),

        ),
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
          Spacer(),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return MyBookShowModalBottomSheetView();
                  });
            },
            child: Container(
              margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
              child: Icon(Icons.more_horiz),
            ),
          ),
        ],
      ),
    );
  }
}

class MyBookShowModalBottomSheetView extends StatelessWidget {
  const MyBookShowModalBottomSheetView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(MARGIN_MEDIUM_2),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "My book",
              style: TextStyle(
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
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
        ModalBottomSheetListTitleView(Icons.edit, "Rename shelf"),
        ModalBottomSheetListTitleView(Icons.delete, "Delete shelf"),

      ],
    );
  }
}
