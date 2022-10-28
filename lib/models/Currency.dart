class Currency{
  late String code;
  late String symbol;
  late String name;

  Currency.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        symbol = json['symbol'],
        name = json['name'];
}
