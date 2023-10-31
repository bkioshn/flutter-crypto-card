import 'package:cryptocurrency_card/model/token.dart';
import 'package:cryptocurrency_card/service/token_service.dart';
import 'package:cryptocurrency_card/widgets/search_bar.dart';
import 'package:cryptocurrency_card/widgets/token_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TokenService tokenService = TokenService();
  Token token = const Token(name: '', symbol: '', lastUpdated: '', price: 0, imageUri: '', description: '');
  bool isError = false;
  void onSubmitFromSearchBar(String slug) async {
    try {
      // Data fetching
      final tokenInfoRes = await tokenService.fetchTokenInfo(slug);
      final tokenMetadataRes = await tokenService.fetchTokenMetadata(slug);

      setState(() {
        token = Token(
            name: tokenInfoRes.name,
            symbol: tokenInfoRes.symbol,
            lastUpdated: tokenInfoRes.lastUpdated,
            price: tokenInfoRes.price,
            imageUri: tokenMetadataRes.imageUri,
            description: tokenMetadataRes.description);
        // Value is set, no error
        isError = false;
      });
    } catch (error) {
      setState(() {
        isError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptocurrency Card',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Search your cryptocurrency'),
          backgroundColor: Colors.teal[800],
        ),
        body: Center(
            child: SizedBox(
                width: 500,
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  TokenCard(token: token),
                  const SizedBox(height: 10),
                  SearchTrack(callback: onSubmitFromSearchBar),
                  if (isError)
                    const Padding(padding: EdgeInsets.all(20.0), child: Text("Error occurs, please try again")),
                ]))),
      ),
    );
  }
}
