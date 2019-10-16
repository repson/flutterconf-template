import 'package:flutter/material.dart';

/// Widget that indicates the user what to do.
/// Used as a placeholder in the desktop layout.
class PlaceholderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.list,
            size: 64,
            color: Theme.of(context).textTheme.caption.color,
          ),
          SizedBox(height: 8),
          Text(
            'Select post from the list',
            style: Theme.of(context).textTheme.subhead.copyWith(
                  color: Theme.of(context).textTheme.caption.color,
                ),
          )
        ],
      ),
    );
  }
}
