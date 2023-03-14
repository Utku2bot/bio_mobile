import 'dart:convert';

import 'package:biocoder/Utils/dimensions.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Utils/colors.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({Key? key}) : super(key: key);

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class Data {
  final int userId;
  final int id;
  final String title;

  Data({required this.userId, required this.id, required this.title});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

Future<List<Data>> fetchData() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class _WeightPageState extends State<WeightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bioGreen,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Weight"),
              SizedBox(
                width: Dimensions.width200,
                height: Dimensions.height200,
                child: Image.asset(
                  "assets/weight_image.png",
                  scale: 2,
                ),
              )
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /*Material(
              borderRadius: BorderRadius.circular(40),
              elevation: 5,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                width: 400,
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: DataTable2(
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 300,
                    columns: const [
                      DataColumn2(
                          label: Text('Cihaz'),
                          numeric: false,
                          size: ColumnSize.S),
                      DataColumn2(
                          label: Text('Boş (dara)(gr)'),
                          numeric: true,
                          size: ColumnSize.M),
                      DataColumn2(
                          label: Text('Günlük (gr)'),
                          numeric: true,
                          size: ColumnSize.M),
                      DataColumn2(
                          label: Text('Anlık (gr)'),
                          numeric: true,
                          size: ColumnSize.S),
                    ],
                    rows: List<DataRow>.generate(
                      10,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text('Cihaz ${index + 1}')),
                          DataCell(Text('12700')),
                          DataCell(Text('${60 + index}')),
                          DataCell(Text('${42000 + index * 100}')),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),*/
            FutureBuilder<List<Data>>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Material(
                    borderRadius: BorderRadius.circular(40),
                    elevation: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      width: 400,
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: DataTable2(
                          columnSpacing: 12,
                          horizontalMargin: 12,
                          minWidth: 300,
                          columns: const [
                            DataColumn2(
                                label: Text('Cihaz'),
                                numeric: false,
                                size: ColumnSize.S),
                            DataColumn2(
                                label: Text('Boş (dara)(gr)'),
                                numeric: true,
                                size: ColumnSize.S),
                            DataColumn2(
                                label: Text('Günlük (gr)'),
                                numeric: true,
                                size: ColumnSize.M),

                          ],
                          rows: List.generate(
                            snapshot.data!.length,
                                (index) {
                              var data = snapshot.data![index];
                              return DataRow(cells: [
                                DataCell(
                                  Text(data.userId.toString()),
                                ),
                                DataCell(
                                  Text(data.id.toString()),
                                ),
                                DataCell(
                                  Text(data.title),
                                ),
                              ]);
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                  );}
                else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                // By default show a loading spinner.
                return const CircularProgressIndicator();

              },
            ),
            Material(
              elevation: 5,
              child: Image.asset(
                "assets/weight2.png",
                scale: 1,
              ),
            ),
          ],
        ));
  }
}
