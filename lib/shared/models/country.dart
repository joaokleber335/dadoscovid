import 'dart:convert';

class Country {
  String id;
  String country;
  String countryCode;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String date;
  Country({
    required this.id,
    required this.country,
    required this.countryCode,
    required this.slug,
    required this.newConfirmed,
    required this.totalConfirmed,
    required this.newDeaths,
    required this.totalDeaths,
    required this.newRecovered,
    required this.totalRecovered,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'Country': country,
      'CountryCode': countryCode,
      'Slug': slug,
      'NewConfirmed': newConfirmed,
      'TotalConfirmed': totalConfirmed,
      'NewDeaths': newDeaths,
      'TotalDeaths': totalDeaths,
      'NewRecovered': newRecovered,
      'TotalRecovered': totalRecovered,
      'Date': date,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      id: map['ID'],
      country: map['Country'],
      countryCode: map['CountryCode'],
      slug: map['Slug'],
      newConfirmed: map['NewConfirmed'],
      totalConfirmed: map['TotalConfirmed'],
      newDeaths: map['NewDeaths'],
      totalDeaths: map['TotalDeaths'],
      newRecovered: map['NewRecovered'],
      totalRecovered: map['TotalRecovered'],
      date: map['Date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source));
}
