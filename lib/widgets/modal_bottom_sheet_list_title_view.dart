import 'package:flutter/material.dart';

class ModalBottomSheetListTitleView extends StatelessWidget {
  final String text;
  IconData icon;
  final Function? onTapButton;

  ModalBottomSheetListTitleView( this.icon, this.text, { this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: new Icon(this.icon),
      title: new Text(this.text),
      onTap: () {
        this.onTapButton!();
      },
    );
  }
}
