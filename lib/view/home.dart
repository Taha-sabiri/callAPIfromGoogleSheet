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

    setState(() {
      jsonData.forEach((element) {
        DataModel dataModel = new DataModel();
        dataModel.cost = element['costPay'].toString();
        dataModel.data = element['dataPay'].toString();
        print(dataModel.cost);
        dataItem.add(dataModel);
      });
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
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "میلگــرد بســتر",
              style: TextStyle(
                  color: Colors.red, fontFamily: 'Kenar', fontSize: 40),
            ),
            Text(
              "لیست پرداخت های شرکت میلگرد بستر ",
              style: TextStyle(
                  color: Color.fromARGB(255, 23, 23, 23),
                  fontFamily: 'kalame',
                  fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 300,
                width: 400,
                child: ListView.builder(
                  itemCount: dataItem.length,
                  itemBuilder: (context, index) {
                    // print(dataItem[index].cost);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color.fromARGB(255, 107, 107, 107),
                              width: .5),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "مبلغ : ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 23, 23, 23),
                                        fontFamily: 'kalame',
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "${dataItem[index].cost.toString()} ریال",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 23, 23, 23),
                                        fontFamily: 'kalame',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "تاریخ :",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 23, 23, 23),
                                        fontFamily: 'kalame',
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "${dataItem[index].data.toString()} ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 23, 23, 23),
                                        fontFamily: 'kalame',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
