import 'package:biocoder/Pages/home_page.dart';
import 'package:flutter/material.dart';
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
    return SafeArea(

      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,

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
                  textLabel: 'Kullanıcı Adı',
                  icon: const Icon(Icons.account_circle_sharp,color: bioGreen,),
                  colorBorder: bioBlue,
                  colorHint: bioBlue,
                  colorLabel: bioGreen,
                ),
                WidgetTextField(
                  obscure: true,
                  controller: passwordController,
                  textLabel: 'Şifre',
                  icon: const Icon(Icons.key_outlined,color: bioGreen,),
                  colorBorder: bioBlue,
                  colorHint: bioBlue,
                  colorLabel: bioGreen,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyTextButton(text: "Şifremi Unuttum",onPressed: (){
                     /* Navigator.push(context, MaterialPageRoute(builder: (context){
                        return PasswordPage();
                      }));*/
                    },
                      textStyle: const TextStyle(color: bioBlue,fontSize: 15,fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                MyButton(
                  height: 50,width: 300,
                  color: bioBlue,
                  text: "Giriş Yap",
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const HomePage();
                    },));
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10,),
                    const Text("Üye Değil misin?",style: TextStyle(color: bioBlue,fontSize: 18,fontWeight: FontWeight.w500),),
                    MyTextButton(
                      text: 'Kayıt Ol',
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
