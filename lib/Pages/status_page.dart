import 'package:biocoder/Utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/colors.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bioBlue,
        elevation: 0,
        title: Text("home_durum".tr),
      ),
      body:
      Center(
        child:
        Material(
          elevation: Dimensions.padHeight10,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Container(
            height: Dimensions.height200/2,
            width: Dimensions.width200,
            decoration: const BoxDecoration(
              color: bioBlue,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child:  Center(child:  Text("ihlalvar".tr,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),)),
          ),
        )
        ,
      ),
    );
  }
}
