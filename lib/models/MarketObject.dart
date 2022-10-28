import 'Currency.dart';
import 'Timezone.dart';

class MarketObject{
  late String name;
  late String acronym;
  late String mic;
  late String country;
  late String country_code;
  late String city;
  late String website;
  late Timezone timezone;
  late Currency currency;

  MarketObject.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        acronym = json['acronym'],
        mic = json['mic'],
        country = json['country'],
        country_code = json['country_code'],
        city = json['city'],
        website = json['website'];
}