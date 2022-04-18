
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StoryAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool authenticateduser = true;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          "Market"
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.category),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.library_books),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
          )
        ],
      );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}