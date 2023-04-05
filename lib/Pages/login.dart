import 'dart:convert';
import 'package:biocoder/Pages/home_page.dart';
import 'package:biocoder/Utils/colors.dart';
import 'package:biocoder/Utils/dimensions.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as ht;
import 'package:http/http.dart';
import '../Widgets/my_button.dart';


bool visible = true;

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Duration get loginTime => const Duration(milliseconds: 2250);
  String il = "";
  String ilce = "";
  String ariCins = "";
  String kovanCins = "";
  var ilList = ["Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Aksaray", "Amasya", "Ankara", "Antalya", "Ardahan", "Artvin", "Aydın", "Balıkesir", "Bartın", "Batman", "Bayburt", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Düzce", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkâri", "Hatay", "Iğdır", "Isparta", "İstanbul", "İzmir", "Kahramanmaraş", "Karabük", "Karaman", "Kars", "Kastamonu", "Kayseri", "Kilis", "Kırıkkale", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Mardin", "Mersin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Osmaniye", "Rize", "Sakarya", "Samsun", "Şanlıurfa", "Siirt", "Sinop", "Sivas", "Şırnak", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Uşak", "Van", "Yalova", "Yozgat", "Zonguldak"];

  Future<String?> _authUser(LoginData loginData) async {


    try {
      ht.Response response = await post(
          Uri.parse("https://reqres.in/api/login"),
          //Uri.parse("http://localhost:7259/api/ValuesController1/login/Login"),

          body: {"email": loginData.name, "password": loginData.password});


      if (response.statusCode == 200) {
        return null;
      } else {
        return "girişbaşarısız".tr;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String?> _signupUser(SignupData data) {
    return Future.delayed(loginTime).then((_) {
      //data.additionalSignupData!["tc"]
      _showMaterialDialog();
      RegExp regex = RegExp(r'^(?=.*?).{8,}$');
      if (!regex.hasMatch(data.password!)) {
        print("deneme");
        return "şifreuyarı8".tr;
      }

      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (true) {
        return 'User not exists';
      }
      return "";
    });
  }

  String? _validataTC(String? value) {
    RegExp regex = RegExp(r'^(?=.*?).{11}$');

    if (!regex.hasMatch(value!)) {
      print("object");
      return "şifreuyarı11".tr;
    }

    return null;
  }

  String? _validataName(String? value) {
    RegExp regex = RegExp(r'^(?=.*?).{1,20}$');

    if (!regex.hasMatch(value!)) {
      return "şifreuyarı120".tr;
    }

    return null;
  }

  String? _validataNumber(String? value) {
    RegExp regex = RegExp(r'^(?=.*?).{10}$');

    if (!regex.hasMatch(value!)) {
      return "şifreuyarı10".tr;
    }

    return null;
  }

  String? _validataAddress(String? value) {
    RegExp regex = RegExp(r'^(?=.*?).{1,200}$');

    if (!regex.hasMatch(value!)) {
      return "şifreuyarı1200".tr;
    }

    return null;
  }

  String? _validataBusinessNumber(String? value) {
    RegExp regex = RegExp(r'^(?=.*?).{14}$');
// ilk iki rakamı 1-81 arası
    if (!regex.hasMatch(value!)) {
      return "şifreuyarı14".tr;
    }

    return null;
  }

  void _showMaterialDialog() {
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context) {
          return SizedBox(
            width: Dimensions.width200,
            height: Dimensions.height200,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              title: Text('additionalSignUpFormDescription'.tr),
              content: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FindDropdown(

                      items: ilList,
                      label: "il".tr,
                      onChanged: (String? item) {
                        il = item!;

                      },
                      searchBoxDecoration: InputDecoration(
                        hintText: "ara".tr,
                      ),

                    ),
                    FindDropdown(
                      items: ["Brasil", "Itália", "Estados Unidos", "Canadá"],
                      label: "ilçe".tr,
                      onChanged: (String? item) {
                        ilce = item!;

                      },
                      searchBoxDecoration: InputDecoration(
                          hintText: "ara".tr
                      ),
                    ),
                    FindDropdown(
                      items: [
                        "KARNİOL".tr,
                        "KAFKAS".tr,
                        "İTALYAN".tr,
                        "SİYAH (ESMER)".tr,
                        "KIBRIS".tr,
                        "SURİYE".tr,
                        "ANADOLU".tr,
                        "MUĞLA".tr,
                        "İRAN".tr,
                        "YIĞILCA".tr,
                      ],
                      label: "arıcinsi".tr,
                      onChanged: (String? item) {
                        ariCins = item!;

                      },
                      searchBoxDecoration: InputDecoration(
                          hintText: "ara".tr
                      ),
                    ),
                    FindDropdown(
                      items: ["eski".tr, "yeni".tr, "katlı".tr],
                      label: "kovancinsi".tr,
                      onChanged: (String? item) {
                        kovanCins = item!;


                      },
                      searchBoxDecoration: InputDecoration(
                          hintText: "ara".tr
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[

                TextButton(
                  onPressed: () {

                    if(kovanCins.isEmpty || ariCins.isEmpty || il.isEmpty || ilce.isEmpty){

                      Get.snackbar("Uyarı", "Lüften Gerekli Alanları Doldurunuz");

                    }
                    else{
                      Get.back();
                    }


                  },
                  child: Text('submit'.tr),
                )
              ],
            ),
          );
        });
  }

  Future<String> _onSwitchToAdditionalFields(SignupData data) {
    return Future.delayed(loginTime).then((_) {
      _showMaterialDialog();
      return "";
    });
  }

  void changeLanguage() {
    Get.updateLocale(Get.locale == const Locale("tr", "TR")
        ? const Locale("en", "EN")
        : const Locale("tr", "TR"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bioGrey,
      appBar: AppBar(
        toolbarHeight: Dimensions.toolbarHeight,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: Dimensions.padWidth10, top: Dimensions.padHeight10),
            child: MyButton(
                color: bioGreen,
                text: 'button_lang'.tr,
                width: Dimensions.padWidth50,
                height: Dimensions.padHeight30,
                onTap: changeLanguage),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
          onTap: () {
            Get.to(() => const HomePage());
          },
          child: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 12,
            child: Container(
              width: Dimensions.width200 / 2,
              height: Dimensions.height200 / 2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Image.asset(
                'assets/biocoder.png',
                scale: 5,
              ),
            ),
          )),
      body: FlutterLogin(
        onSwitchToAdditionalFields: _onSwitchToAdditionalFields,
        additionalSignupFields: [
          UserFormField(
              keyName: "tc",
              displayName: "tc".tr,
              userType: LoginUserType.phone,
              fieldValidator: _validataTC),
          UserFormField(
              keyName: "ad",
              displayName: "ad".tr,
              userType: LoginUserType.name,
              fieldValidator: _validataName),
          UserFormField(
              keyName: "soyad",
              displayName: "soyad".tr,
              userType: LoginUserType.name,
              fieldValidator: _validataName),
          UserFormField(
              keyName: "işletmeno",
              displayName: "işletmenumarası".tr,
              userType: LoginUserType.phone,
              fieldValidator: _validataBusinessNumber),
          UserFormField(
              keyName: "ceptelefon",
              displayName: "ceptelefon".tr,
              userType: LoginUserType.phone,
              fieldValidator: _validataNumber),
          UserFormField(
              keyName: "adres",
              displayName: "adres".tr,
              userType: LoginUserType.name,
              fieldValidator: _validataAddress),
        ],
        userType: LoginUserType.email,
        messages: LoginMessages(
            goBackButton: "geri".tr,
            additionalSignUpSubmitButton: "submit".tr,
            additionalSignUpFormDescription:
                "additionalSignUpFormDescription".tr,
            passwordHint: "login_şifre".tr,
            forgotPasswordButton: "login_şifremiunuttum".tr,
            loginButton: "login_girişyap".tr,
            signupButton: "login_kayıtol".tr,
            confirmPasswordHint: "şifretekrar".tr),
        headerWidget: Center(
            child: Image.asset(
          'assets/logbee.png',
          scale: 5,
        )),
        theme: LoginTheme(
          cardInitialHeight: Dimensions.loginCardInitialHeight,
          buttonTheme: const LoginButtonTheme(backgroundColor: bioGreen),
          primaryColor: bioGrey,
          cardTheme: const CardTheme(
            color: Colors.white,
          ),
        ),
        onLogin: _authUser,
        onSignup: _signupUser,
        onSubmitAnimationCompleted: () {
          Get.to(() => const HomePage());
        },
        onRecoverPassword: _recoverPassword,
      ),
    );
  }
}
