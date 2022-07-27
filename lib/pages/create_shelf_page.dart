import 'package:flutter/material.dart';
import 'package:google_play_books_app/resources/colors.dart';
import 'package:google_play_books_app/resources/dimens.dart';

class CreateShelfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              TitleView(() => Navigator.pop(context)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                child: Column(
                  children: [
                    SizedBox(height: MARGIN_XXLARGE),
                    TextField(
                      maxLength: 50,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Shelf name',
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: TEXT_REGULAR_3X,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MARGIN_MEDIUM_2),
              Divider(thickness: 2),
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
          SizedBox(width: MARGIN_MEDIUM),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Create shelf",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: TEXT_REGULAR_2X,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
