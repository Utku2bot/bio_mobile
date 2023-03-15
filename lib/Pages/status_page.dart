import 'package:biocoder/Utils/dimensions.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/colors.dart';
import '../Widgets/elevated_container.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  List<DataRow> row = [
    DataRow(cells: [
      DataCell(Text('Cihaz ${1}')),
      DataCell(Text('${30}')),
      DataCell(Text('%${50}')),
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bioBlue,
        elevation: 0,
        title: Text("home_durum".tr),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: Dimensions.padHeight10,horizontal: Dimensions.padWidth10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(40),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                width: Dimensions.width200 * 2,
                height: Dimensions.width200 * 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: DataTable2(
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: Dimensions.width200,
                    columns: const [
                      DataColumn2(
                          label: Text('Cihaz'),
                          numeric: false,
                          size: ColumnSize.S),
                      DataColumn2(
                          label: Text('Durum'),
                          numeric: true,
                          size: ColumnSize.S),
                    ],
                    rows: List<DataRow>.generate(
                      10,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text('Cihaz ${index + 1}')),
                          DataCell(Text('Aktif')),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: ElevatedContainer(
          elevation: 10,
          height: Dimensions.height200 / 3,
          width: Dimensions.width200 / 2,
          color: bioBlue,
          text: "İhlal Var",
          fontSize: 20),
    );
  }
}
