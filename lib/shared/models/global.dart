import 'dart:convert';

class Global {
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String date;
  Global({
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
      'NewConfirmed': newConfirmed,
      'TotalConfirmed': totalConfirmed,
      'NewDeaths': newDeaths,
      'TotalDeaths': totalDeaths,
      'NewRecovered': newRecovered,
      'TotalRecovered': totalRecovered,
      'Date': date,
    };
  }

  factory Global.fromMap(Map<String, dynamic> map) {
    return Global(
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

  factory Global.fromJson(String source) => Global.fromMap(json.decode(source));
}
