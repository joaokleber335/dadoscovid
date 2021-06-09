import 'package:dadoscovid/pages/detail/detail_page.dart';
import 'package:dadoscovid/pages/home/home_controller.dart';
import 'package:dadoscovid/repositories/data_wrapper_repository_impl.dart';
import 'package:dadoscovid/shared/http_provider/http_provider_impl.dart';
import 'package:dadoscovid/shared/models/country.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController(
      repository: DataWrapperRepositoryImpl(httpProvider: HttpProviderImpl()));
  final filteredCountries = [];

  @override
  void initState() {
    print('trouxe dados');
    controller.getDataCovid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dados mundiais do covid',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            _createGlobalBody(),
            _createSearch(),
            _createBody(),
          ],
        ),
      ),
    );
  }

  _createGlobalBody() {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: controller.global,
        builder: (_, __, ___) {
          if (controller.global.value != null) {
            return Column(
              children: [
                _createTitle(),
                SizedBox(
                  height: 15,
                ),
                _createGlobalData(),
              ],
            );
          }
          return Text('Loading...');
        },
      ),
    );
  }

  _createSearch() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Search...',
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: (value) {
        controller.filteredCountries.value = controller.countries.value
            .where((country) =>
                country.country.toLowerCase().contains(value.toLowerCase()))
            .toList();
      },
    );
  }

  _createBody() {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: controller.filteredCountries,
        builder: (_, __, ___) {
          return ListView.builder(
            itemCount: controller.filteredCountries.value.length,
            itemBuilder: (_, index) {
              final country = controller.filteredCountries.value[index];
              return ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${country.country} - ${country.countryCode}"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("${country.date}"),
                    ],
                  ),
                ),
                onTap: () {
                  _goToCountryDetail(country);
                },
              );
            },
          );
        },
      ),
    );
  }

  _createTitle() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dados globais'),
            SizedBox(height: 5),
            Text(controller.global.value!.date),
          ],
        )
      ],
    );
  }

  _createGlobalData() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.asset(
                'images/angry.png',
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              child: Text(
                  "Total confirmados: ${controller.global.value!.totalConfirmed}"),
            )
          ],
        ),
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.asset(
                'images/happy.png',
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              child: Text(
                  "Total recuperados: ${controller.global.value!.totalRecovered}"),
            )
          ],
        ),
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.asset(
                'images/sad.png',
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              child:
                  Text("Total mortes: ${controller.global.value!.totalDeaths}"),
            )
          ],
        )
      ],
    );
  }

  _goToCountryDetail(Country country) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => DetailPage(country: country)));
  }
}
