import 'package:biocoder/Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/colors.dart';
import '../Widgets/my_button.dart';
import '../Widgets/widget_text_button.dart';
import '../Widgets/widget_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final usernameController = TextEditingController();

    void changeLanguage(){
      Get.updateLocale(
          Get.locale == const Locale("tr","TR") ?  const Locale("en","EN")  :  const Locale("tr","TR")
      );
    }
    return SafeArea(

      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 30,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8,top: 8),
              child: MyButton(color: bioGreen, text: 'button_lang'.tr, width: 50, height: 30,
                onTap: changeLanguage

              ),
            ),
          ],

        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/biocoder.png",
                  scale: 2,
                ),

                WidgetTextField(
                  obscure: false,
                  controller: usernameController,
                  textLabel: 'login_kullanıcıadı'.tr,
                  icon: const Icon(Icons.account_circle_sharp,color: bioGreen,),
                  colorBorder: bioBlue,
                  colorHint: bioBlue,
                  colorLabel: bioGreen,
                ),
                WidgetTextField(
                  obscure: true,
                  controller: passwordController,
                  textLabel: 'login_şifre'.tr,
                  icon: const Icon(Icons.key_outlined,color: bioGreen,),
                  colorBorder: bioBlue,
                  colorHint: bioBlue,
                  colorLabel: bioGreen,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyTextButton(text: "login_şifremiunuttum".tr,onPressed: (){

                    },
                      textStyle: const TextStyle(color: bioBlue,fontSize: 15,fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                MyButton(
                  height: 50,width: 300,
                  color: bioBlue,
                  text: "login_girişyap".tr,
                  onTap: (){
                    Get.to(() => const HomePage());
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10,),
                    Text("login_üyedeğilmisiniz".tr,style: const TextStyle(color: bioBlue,fontSize: 18,fontWeight: FontWeight.w500),),
                    MyTextButton(
                      text: 'login_kayıtol'.tr,
                      onPressed: null,
                      textStyle: const TextStyle(color: bioGreen,fontSize: 15,fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
