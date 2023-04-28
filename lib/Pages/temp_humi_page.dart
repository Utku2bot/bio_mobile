import 'package:biocoder/Pages/tem_humi_char_page.dart';
import 'package:biocoder/Utils/colors.dart';
import 'package:biocoder/Utils/dimensions.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/elevated_container.dart';

class TempHumiPage extends StatefulWidget {
  const TempHumiPage({Key? key}) : super(key: key);

  @override
  State<TempHumiPage> createState() => _TempHumiPageState();
}

class _TempHumiPageState extends State<TempHumiPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bioGreen,
          elevation: 0,
          title: Text("home_sıcaklıkvenem".tr),
          centerTitle: true,
        ),

        body: Center(
          child: Padding(
            padding:  EdgeInsets.all(Dimensions.padWidth10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Material(
                  borderRadius: BorderRadius.circular(40),
                  elevation: 5,
                  child: Container(
                    decoration: const BoxDecoration(
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
                        minWidth:  (Dimensions.width200/2)*3,

                        columns: [
                          DataColumn2(
                              label: Text('cihaz'.tr),
                              numeric: false,
                              size: ColumnSize.S),
                          DataColumn2(
                              label: Text('${"sıcaklık".tr} (°C)'),
                              numeric: true,
                              size: ColumnSize.M),
                          DataColumn2(
                              label: Text('${"nem".tr} (%)'),
                              numeric: true,
                              size: ColumnSize.M),

                        ],
                        rows: List<DataRow>.generate(
                          1,
                              (index) => DataRow(
                            cells: [
                              DataCell(Text('${"cihaz".tr} ${index + 1}')),
                              DataCell(Text(Get.arguments["sicaklik"].toString())),
                              DataCell(Text(Get.arguments["nem"].toString())),

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
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: InkWell(
          onTap: (){
           Get.to(()=>const TempHumiCharPage());

          },
          child: ElevatedContainer(
            elevation: 5,
            height: Dimensions.height200 / 4,
            width: Dimensions.width200 ,
            color: bioGreen,
            text: "grafikler".tr,
            fontSize: 20),
        ),
      ),
    );
  }
}
