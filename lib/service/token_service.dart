import 'dart:async';
import 'dart:convert';

import 'package:cryptocurrency_card/model/token.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TokenService {
  static String tokenApi = dotenv.env['TOKEN_API'] ?? '';
  static String tokenApiKey = dotenv.env['TOKEN_API_KEY'] ?? '';

  Future fetchTokenInfo(String slug) async {
    final queryParameters = {
      'slug': slug,
    };

    final uriPath = Uri.https(tokenApi, '/v2/cryptocurrency/quotes/latest', queryParameters);

    final response = await _fetchData(uriPath);

    if (response.statusCode == 200) {
      return TokenInfo.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future fetchTokenMetadata(String slug) async {
    final queryParameters = {
      'slug': slug,
    };

    final uriPath = Uri.https(tokenApi, '/v2/cryptocurrency/info', queryParameters);

    final response = await _fetchData(uriPath);
    if (response.statusCode == 200) {
      return TokenMetadata.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future _fetchData(Uri uriPath) async {
    _throwNoEnvError();
    return await http.get(
      Uri.parse('https://corsproxy.io/?${Uri.encodeComponent(uriPath.toString())}'),
      headers: {
        'Accept': 'application/json',
        'X-CMC_PRO_API_KEY': tokenApiKey,
      },
    );
  }

  void _throwNoEnvError() {
    if (tokenApi == '' || tokenApiKey == '') throw Exception('TokenAPI or TokenAPI is not set');
  }
}
