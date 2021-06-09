import 'package:dadoscovid/repositories/data_wrapper_repository.dart';
import 'package:dadoscovid/shared/models/country.dart';
import 'package:dadoscovid/shared/models/datawrapper.dart';
import 'package:dadoscovid/shared/models/global.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final DataWrapperRepository repository;

  // ValueNotifier<List<DataWrapper>> dataCovid = ValueNotifier([]);
  ValueNotifier<List<Country>> countries = ValueNotifier([]);
  ValueNotifier<List<Country>> filteredCountries = ValueNotifier([]);
  ValueNotifier<Global?> global = ValueNotifier(null);

  HomeController({required this.repository});

  Future<void> getDataCovid() async {
    final result =
        await this.repository.get('https://api.covid19api.com/summary');
    countries.value = result.countries;
    filteredCountries.value = result.countries;
    global.value = result.global;
  }
}
