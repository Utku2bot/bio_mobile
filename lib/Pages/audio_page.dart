import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:biocoder/Utils/dimensions.dart';
import '../Utils/colors.dart';


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
        centerTitle: true,
        title: Text("home_ses".tr),
      ),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.all(Dimensions.padWidth10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Flexible(
                flex: 1,
                child: Material(
                  borderRadius: BorderRadius.circular(40),
                  elevation: 5,
                  child: Container(
                    decoration:  const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                    width: Dimensions.width200*2,
                    height: Dimensions.height200*2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: DataTable2(
                        columnSpacing: 12,
                        horizontalMargin: 12,
                        minWidth: Dimensions.width200,
                        columns:  [
                          DataColumn2(
                              label: Text('cihaz'.tr), numeric: false, size: ColumnSize.S),
                          DataColumn2(
                              label: Text('${"home_ses".tr}(Hz)'),
                              numeric: true,
                              size: ColumnSize.S),

                        ],
                        rows: List<DataRow>.generate(
                          10,
                              (index) => DataRow(
                            cells: [
                              DataCell(Text('${"cihaz".tr} ${index + 1}')),
                              DataCell(Text('${400 + index}')),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.padHeight10,),

              Flexible(
                flex: 1,
                child: Material(
                  borderRadius: BorderRadius.circular(40),
                  elevation: 5,
                  child: Image.asset(
                    "assets/audio_char.png",
                    scale: 1,
                  ),
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}

