import 'package:flutter/material.dart';

class TokenCardEmpty extends StatelessWidget {
  const TokenCardEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return (const Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text("Search your cryptocurrency", style: TextStyle(fontSize: 30)),
        Text(
          "eg. bitcoin, ethereum",
          style: TextStyle(fontSize: 20),
        )
      ],
    )));
  }
}
