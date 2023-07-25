import 'package:banaabnie/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert' as convert;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DataModel> dataItem = List<DataModel>.empty(growable: true);
  GetData() async {
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbykR8AeNcNM6tPrC81EtIXxwQjxEMW42NRDe4mpRpKrRo6_BVNrm1i9zpxfJ9BxSUWQ/exec"));
    var jsonData = convert.jsonDecode(raw.body);

    jsonData.forEach((element) {
      DataModel dataModel = new DataModel();
      dataModel.cost = element['costPay'].toString();
      dataModel.data = element['dataPay'].toString();
      print(dataModel.cost);
      dataItem.add(dataModel);
    });

    // dataItem = jsonData.map((json) => DataModel.fromJson(json));
  }

  @override
  void initState() {
    GetData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: 400,
            child: ListView.builder(
              itemCount: dataItem.length,
              itemBuilder: (context, index) {
                // print(dataItem[index].cost);
                return Row(
                  children: [Text(dataItem[index].data.toString())],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
