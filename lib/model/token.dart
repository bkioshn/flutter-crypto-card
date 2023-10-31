import 'package:cryptocurrency_card/utils/date.dart';

class TokenInfo {
  final String name;
  final String symbol;
  final String lastUpdated;
  final double price;

  const TokenInfo({
    required this.name,
    required this.symbol,
    required this.lastUpdated,
    required this.price,
  });

  factory TokenInfo.fromJson(Map<String, dynamic> json) {
    try {
      final tokenId = json['data'].keys.first;
      final data = json['data'][tokenId];
      final usd = data['quote']['USD'];
      final date = DateTime.parse(data['last_updated']);

      return TokenInfo(
          name: data['name'] as String,
          symbol: data['symbol'] as String,
          lastUpdated: formatDateTime(date),
          price: usd['price'] as double);
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}

class TokenMetadata {
  final String imageUri;
  final String description;

  const TokenMetadata({
    required this.imageUri,
    required this.description,
  });

  factory TokenMetadata.fromJson(Map<String, dynamic> json) {
    try {
      final tokenId = json['data'].keys.first;
      final data = json['data'][tokenId];

      return TokenMetadata(imageUri: data['logo'], description: data['description']);
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}

class Token {
  final String name;
  final String symbol;
  final String lastUpdated;
  final double price;
  final String imageUri;
  final String description;

  const Token({
    required this.name,
    required this.symbol,
    required this.lastUpdated,
    required this.price,
    required this.imageUri,
    required this.description,
  });
}
