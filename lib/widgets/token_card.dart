import 'package:cryptocurrency_card/model/token.dart';
import 'package:cryptocurrency_card/widgets/token_card_empty.dart';
import 'package:cryptocurrency_card/widgets/token_card_info.dart';
import 'package:flutter/material.dart';

class TokenCard extends StatelessWidget {
  final Token token;

  const TokenCard({super.key, required this.token});
  
  @override
  Widget build(BuildContext context) {
    return (Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
            constraints: const BoxConstraints(minHeight: 500, minWidth: double.infinity, maxHeight: 600),
            width: double.infinity,
            child: Card(
                shadowColor: Colors.grey[600],
                elevation: 10,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: token.name != '' ? TokenCardInfo(token: token) : const TokenCardEmpty())))));
  }
}
