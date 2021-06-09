import 'package:dadoscovid/shared/models/country.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Country country;

  const DetailPage({Key? key, required this.country}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: _createBodyDetail(),
    );
  }

  _createBodyDetail() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${widget.country.country} - ${widget.country.countryCode}"),
              SizedBox(
                height: 8,
              ),
              Text("${widget.country.date}"),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          _createGlobalData()
        ],
      ),
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
              child:
                  Text("Total confirmados: ${widget.country.totalConfirmed}"),
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
              child:
                  Text("Total recuperados: ${widget.country.totalRecovered}"),
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
              child: Text("Total mortes: ${widget.country.totalDeaths}"),
            )
          ],
        )
      ],
    );
  }
}
