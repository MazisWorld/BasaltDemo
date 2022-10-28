import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'models/MarketObject.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<MarketObject> marketData = [];

  getMarketData() async {
    var randomOffset = Random().nextInt(50);
    var endpointUrl = Uri.http('api.marketstack.com','/v1/exchanges',
        {'access_key': '14507070fc2954d476188c40a4589b89', 'limit': '10', 'offset':'$randomOffset'});

    var response = await http.get(endpointUrl);

    if (response.statusCode == 200) {
      List<MarketObject> marketObjectList =  (convert.jsonDecode(response.body)['data'] as List)
          .map((data) => MarketObject.fromJson(data))
          .toList();

      print(marketObjectList[1].name);

      marketData = marketObjectList;

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

  }

  @override
  Widget build(BuildContext context) {
    getMarketData();
    return Scaffold(
      body: OfflineBuilder(
        connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
            ) {
          final bool connected = connectivity != ConnectivityResult.none;
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                height: 24.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  color: connected ? const Color(0xFF00EE44) : const Color(0xFFEE4400),
                  child: Center(
                    child: Text(connected ? 'ONLINE' : 'OFFLINE'),
                  ),
                ),
              ),
              ListView.builder(
                  itemCount: marketData.length,
                  itemBuilder: (context, int index){
                    return Text(marketData[index].name);
                  })
            ],
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'There are no bottons to push :)',
            ),
            Text(
              'Just turn off your internet.',
            ),
          ],
        ),
      ),
    );
  }
}