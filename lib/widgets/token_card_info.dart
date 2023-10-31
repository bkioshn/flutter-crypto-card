import 'package:cryptocurrency_card/model/token.dart';
import 'package:flutter/material.dart';

class TokenCardInfo extends StatelessWidget {
  final Token token;

  const TokenCardInfo({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return (Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          token.name,
          style: const TextStyle(fontSize: 40),
        ),
        SizedBox(
            height: 150,
            width: 150,
            child: Image(
              image: NetworkImage(token.imageUri),
              fit: BoxFit.cover,
            )),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              '${token.price.toStringAsFixed(2)} USD',
              style: const TextStyle(fontSize: 30),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text('Symbol: ${token.symbol}'), Text('Last Updated: ${token.lastUpdated}')],
        ),
        Padding(padding: const EdgeInsets.all(30.0), child: Text('\t ${token.description}'))
      ],
    ));
  }
}
