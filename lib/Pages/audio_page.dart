import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/colors.dart';
import '../Utils/dimensions.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: bioBlue,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("home_ses".tr),
            SizedBox(
              width: Dimensions.width200/2,
              height:  Dimensions.height200/2,
              child: Image.asset(
                "assets/audio_image.png",
                scale: 2,
              ),
            )

          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(Dimensions.padWidth10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              borderRadius: BorderRadius.circular(40),
              elevation: 5,
              child: Container(
                decoration:  const BoxDecoration(
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
                    minWidth: 200,
                    columns: const [
                      DataColumn2(
                          label: Text('Cihaz'), numeric: false, size: ColumnSize.S),
                      DataColumn2(
                          label: Text('Ses (Hz)'),
                          numeric: true,
                          size: ColumnSize.S),

                    ],
                    rows: List<DataRow>.generate(
                      10,
                          (index) => DataRow(
                        cells: [
                          DataCell(Text('Cihaz ${index + 1}')),
                          DataCell(Text('${400 + index}')),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Material(
              borderRadius: BorderRadius.circular(40),
              elevation: 5,
              child: Image.asset(
                "assets/audio_char.png",
                scale: 1,
              ),
            ),
          ],

        ),
      ),
    );
  }
}

