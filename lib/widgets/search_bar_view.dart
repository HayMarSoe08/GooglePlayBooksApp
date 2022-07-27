import 'package:flutter/material.dart';
import 'package:google_play_books_app/resources/dimens.dart';

class SearchBarView extends StatelessWidget {
  final Function onTapChange;

  SearchBarView(this.onTapChange);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onTapChange();
      },
      child: Container(
        padding: EdgeInsets.only(
          right: MARGIN_MEDIUM,
          left: MARGIN_MEDIUM,
        ),
        margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
        height: MARGIN_XXLARGE,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
          border: Border.all(
            color: Colors.black12,
            width: BORDER_WIDTH_SMALL,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.black,
            ),
            SizedBox(width: MARGIN_MEDIUM),
            Container(
              child: Text(
                'Search Play Books',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Spacer(),
            Container(
              width: PROFILE_IMAGE_SIZE,
              height: PROFILE_IMAGE_SIZE,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://www.nme.com/wp-content/uploads/2021/02/iu-lilac-photo-edam-entertainment@2000x1270.jpg",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
