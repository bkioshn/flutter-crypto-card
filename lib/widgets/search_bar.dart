import 'package:flutter/material.dart';

class SearchTrack extends StatelessWidget {
  const SearchTrack({super.key, required this.callback});

  final Function(String) callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SearchBar(
      onSubmitted: (value) => callback(value),
    ));
  }
}
