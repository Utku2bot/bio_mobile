import 'package:biocoder/Pages/home_page.dart';
import 'package:biocoder/Utils/colors.dart';
import 'package:biocoder/Utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as ht;
import 'package:http/http.dart';
import '../Widgets/my_button.dart';

const users = {
  'user@gmail.com': '12345',
};
bool visible = true;

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData loginData) async {

    try{
      ht.Response response = await post(
          Uri.parse("https://reqres.in/api/login"),
          body: {
            "email": loginData.name,
            "password" : loginData.password
          }
      );

      if (response.statusCode == 200) {
        return null;
      }  else{
        return "girişbaşarısız".tr;
      }
    }catch(e){
      print(e.toString());
    }

  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }
  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
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
              width: Dimensions.width200/2,
              height: Dimensions.height200/2,
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
        userType: LoginUserType.email,
        messages: LoginMessages(passwordHint: "login_şifre".tr,forgotPasswordButton: "login_şifremiunuttum".tr,loginButton: "login_girişyap".tr,signupButton: "login_kayıtol".tr,confirmPasswordHint: "şifretekrar".tr),
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
