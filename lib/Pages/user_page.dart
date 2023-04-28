import 'dart:math';
import 'package:biocoder/Utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/colors.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: bioBlue,
        title: Text("home_kullanıcı".tr),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                ClipPath(
                  clipper: CurvedBottomClipper(),
                  child: Container(
                    color: bioBlue,
                    height: 110,
                  ),
                ),
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    height: 100,
                    width:  100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: Image.asset(
                      "assets/user_image.png",
                      scale: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Dimensions.padWidth30,vertical: Dimensions.padHeight50/2),
              child: Column(

                children: [
                  Row(
                    children: [
                      Icon(Icons.account_circle, size: 40, color: bioBlue,),
                      SizedBox(width: Dimensions.padWidth30*2,),
                      Text(Get.arguments["adi"], style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),),
                    ],
                  ),
                  SizedBox(height: Dimensions.padHeight10*1.5,),
                  Container(height: 1,color: Colors.grey,),
                  SizedBox(height: Dimensions.padHeight30,),
                  Row(

                    children: [
                      Icon(Icons.accessibility, size: 40, color: bioBlue,),
                      SizedBox(width: Dimensions.padWidth30*2,),
                      Text(Get.arguments["soyadi"], style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),),
                    ],
                  ),
                  SizedBox(height: Dimensions.padHeight10*1.5,),
                  Container(height: 1,color: Colors.grey,),
                  SizedBox(height: Dimensions.padHeight30,),
                  Row(
                    children: [
                      Icon(Icons.account_balance, size: 40, color: bioBlue,),
                      SizedBox(width: Dimensions.padWidth30*2,),
                      Text(Get.arguments["isletme_no"], style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),),
                    ],
                  ),
                  SizedBox(height: Dimensions.padHeight10*1.5,),
                  Container(height: 1,color: Colors.grey,),
                  SizedBox(height: Dimensions.padHeight30,),
                  Row(
                    children: [
                      Icon(Icons.numbers, size: 40, color: bioBlue,),
                      SizedBox(width: Dimensions.padWidth30*2,),
                      Text(Get.arguments["cep_telefon"], style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),),
                    ],
                  ),
                  
                  SizedBox(height: Dimensions.padHeight10*1.5,),
                  Container(height: 1,color: Colors.grey,),
                  SizedBox(height: Dimensions.padHeight30,),
                  Row(
                    children: [
                      Icon(Icons.hive, size: 40, color: bioBlue,),
                      SizedBox(width: Dimensions.padWidth30*2,),
                      Text(Get.arguments["kovanSayisi"].toString(), style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),),
                    ],
                  ),
                  SizedBox(height: Dimensions.padHeight10*1.5,),
                  Container(height: 1,color: Colors.grey,),
                  SizedBox(height: Dimensions.padHeight30,),
                  Row(
                     children: [
                      Icon(Icons.adb, size: 40, color: bioBlue,),
                      SizedBox(width: Dimensions.padWidth30*2,),
                      Text("versiyon".tr, style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Material(
        elevation: Dimensions.padHeight10,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: Container(
          height: Dimensions.height200/4,
          width: Dimensions.width200/2,
          decoration: const BoxDecoration(
            color: bioGreen,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child:  Center(child:  Text("güncelle".tr,style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),)),
        ),
      ),
    );
  }
}


class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final roundingHeight = size.height * 3 / 5;

    final filledRectangle =
    Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);

    final roundingRectangle = Rect.fromLTRB(
        -5, size.height - roundingHeight * 2, size.width + 5, size.height);

    final path = Path();
    path.addRect(filledRectangle);

    path.arcTo(roundingRectangle, pi, -pi, true);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
