import 'package:flutter/material.dart';
import 'package:google_play_books_app/blocs/home_bloc.dart';
import 'package:google_play_books_app/resources/colors.dart';
import 'package:google_play_books_app/resources/dimens.dart';
import 'package:google_play_books_app/widgets/view_as_large_grid_view.dart';
import 'package:google_play_books_app/widgets/view_as_list_view.dart';
import 'package:google_play_books_app/widgets/view_as_small_gird_view.dart';
import 'package:provider/provider.dart';

class YourBooksView extends StatelessWidget {
  final String callPage;
  final Function onTapAddToShelf;

  YourBooksView(this.callPage, this.onTapAddToShelf);

  int val = 1;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(),
      child: Selector<HomeBloc, int>(
        selector: (context, bloc) => bloc.viewStyle,
        builder: (context, viewStyle, child) => Container(
          margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: Column(
            children: [
              FilterView(),
              SizedBox(height: MARGIN_MEDIUM),
              SortAndShowView((value) {
                HomeBloc bloc =
                    Provider.of<HomeBloc>(context, listen: false);
                bloc.setViewStyle(value);
              }),
              SizedBox(height: MARGIN_MEDIUM),
              Container(
                height: (MediaQuery.of(context).size.height * 0.65),
                child: viewStyle == 1
                    ? ViewAsListView(this.callPage, this.onTapAddToShelf)
                    : viewStyle == 2
                        ? ViewAsLargeGridView(
                            this.callPage, this.onTapAddToShelf)
                        : ViewAsSmallGridView(
                            this.callPage, this.onTapAddToShelf),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SortAndShowView extends StatelessWidget {
  final Function(int) onChangeView;

  SortAndShowView(this.onChangeView);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SortByShowModalBottomSheetView();
                  });
            },
            child: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.sort,
                  ),
                  SizedBox(width: MARGIN_SMALL),
                  Text(
                    "Sort by Recent",
                    style: TextStyle(
                      fontSize: TEXT_REGULAR_X,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ViewAsShowModalBottomSheetView(
                        (value) => this.onChangeView(value));
                  });
            },
            child: Icon(Icons.view_comfortable_outlined),
          ),
        ],
      ),
    );
  }
}

class FilterView extends StatelessWidget {
  const FilterView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: CHIP_LIST_VIEW_HEIGHT,
      child: Flexible(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MARGIN_XLARGE,
                height: MARGIN_XLARGE,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: CHIP_BORDER_TEXT_COLOR,
                  ),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: MARGIN_MEDIUM_2,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                left: MARGIN_MEDIUM,
              ),
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Chip(
                        backgroundColor: CHIP_SELECTED_COLOR,
                        padding: EdgeInsets.only(
                            top: MARGIN_MEDIUM,
                            left: MARGIN_MEDIUM,
                            bottom: MARGIN_MEDIUM,
                            right: MARGIN_MEDIUM),
                        shape: StadiumBorder(
                            side: BorderSide(color: CHIP_BORDER_TEXT_COLOR)),
                        label: Text(
                          "Ebooks",
                          style: TextStyle(
                            fontSize: TEXT_REGULAR_X,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                left: MARGIN_MEDIUM,
              ),
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: CHIP_LIST_ITEM_HEIGHT,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(MARGIN_MEDIUM_3),
                              border: Border.all(
                                color: CHIP_BORDER_TEXT_COLOR,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Chip(
                                  backgroundColor: PRIMARY_COLOR,
                                  padding: EdgeInsets.only(
                                      top: MARGIN_MEDIUM,
                                      left: MARGIN_MEDIUM,
                                      bottom: MARGIN_MEDIUM,
                                      right: MARGIN_MEDIUM),
                                  label: Text(
                                    "Not started",
                                    style: TextStyle(
                                      fontSize: TEXT_REGULAR_X,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(MARGIN_MEDIUM),
                                    border: Border.all(
                                      color: CHIP_BORDER_TEXT_COLOR,
                                    ),
                                  ),
                                ),
                                Chip(
                                  backgroundColor: PRIMARY_COLOR,
                                  padding: EdgeInsets.only(
                                      top: MARGIN_MEDIUM,
                                      left: MARGIN_MEDIUM,
                                      bottom: MARGIN_MEDIUM,
                                      right: MARGIN_MEDIUM),
                                  label: Text(
                                    "In Progress",
                                    style: TextStyle(
                                      fontSize: TEXT_REGULAR_X,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SortByShowModalBottomSheetView extends StatelessWidget {
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
              "Sort by",
              style: TextStyle(
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Divider(thickness: 2),
        ListTile(
          title: Text("Recently opened"),
          leading: Radio(
            value: 2,
            groupValue: 1,
            onChanged: (value) {},
            activeColor: Colors.green,
          ),
        ),
        ListTile(
          title: Text("Title"),
          leading: Radio(
            value: 2,
            groupValue: 2,
            onChanged: (value) {},
            activeColor: Colors.green,
          ),
        ),
        ListTile(
          title: Text("Author"),
          leading: Radio(
            value: 2,
            groupValue: 1,
            onChanged: (value) {},
            activeColor: Colors.green,
          ),
        ),
      ],
    );
  }
}

class ViewAsShowModalBottomSheetView extends StatefulWidget {
  final Function(int) onChangeView;

  ViewAsShowModalBottomSheetView(this.onChangeView);

  @override
  _ViewAsShowModalBottomSheetViewState createState() =>
      _ViewAsShowModalBottomSheetViewState();
}

class _ViewAsShowModalBottomSheetViewState
    extends State<ViewAsShowModalBottomSheetView> {
  int val = 1;

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
              "View as",
              style: TextStyle(
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Divider(thickness: 2),
        ListTile(
          title: Text("List"),
          leading: Radio(
            value: 1,
            groupValue: val,
            onChanged: (value) {
              setState(() {
                val = int.parse(value.toString());
                this.widget.onChangeView(val);
              });
            },
            activeColor: SELECTED_TEXT_COLOR,
          ),
        ),
        ListTile(
          title: Text("Large grid"),
          leading: Radio(
            value: 2,
            groupValue: val,
            onChanged: (value) {
              setState(() {
                val = int.parse(value.toString());
                this.widget.onChangeView(val);
              });
            },
            activeColor: SELECTED_TEXT_COLOR,
          ),
        ),
        ListTile(
          title: Text("Small grid"),
          leading: Radio(
            value: 3,
            groupValue: val,
            onChanged: (value) {
              setState(() {
                val = int.parse(value.toString());
                this.widget.onChangeView(val);
              });
            },
            activeColor: SELECTED_TEXT_COLOR,
          ),
        ),
      ],
    );
  }
}
