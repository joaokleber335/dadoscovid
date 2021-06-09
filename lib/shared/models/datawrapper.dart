import 'dart:convert';

import 'package:dadoscovid/shared/models/country.dart';
import 'package:dadoscovid/shared/models/global.dart';

class DataWrapper {
  String id;
  String message;
  Global global;
  List<Country> countries;
  String date;
  DataWrapper({
    required this.id,
    required this.message,
    required this.global,
    required this.countries,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'Message': message,
      'Global': global.toMap(),
      'Countries': countries.map((x) => x.toMap()).toList(),
      'Date': date,
    };
  }

  factory DataWrapper.fromMap(Map<String, dynamic> map) {
    return DataWrapper(
      id: map['ID'],
      message: map['Message'],
      global: Global.fromMap(map['Global']),
      countries:
          List<Country>.from(map['Countries']?.map((x) => Country.fromMap(x))),
      date: map['Date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataWrapper.fromJson(String source) =>
      DataWrapper.fromMap(json.decode(source));
}
