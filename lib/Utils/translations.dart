import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      "button_lang" : "EN",
      'login_kullanıcıadı': 'Username',
      'login_şifre': 'Password',
      'login_şifremiunuttum': 'Forgot Password',
      'login_girişyap': 'Login',
      'login_üyedeğilmisiniz': 'Not a member?',
      'login_kayıtol': 'Register',

      "home_kullanıcı" : "User",
      "home_ayarlar" : "Settings",
      "home_durum" : "Status",
      "home_ses" : "Audio",
      "home_konum" : "Location",
      "home_sıcaklıkvenem" : "Temperature and Humidity",
      "home_havadurumu" : "Weather Condition",
      "home_ağırlık" : "Weight",

      "weather_sıcaklık" : "Temperature",
      "weather_rüzgar" : "Wind",
      "weather_nem" : "Humidity"


    },
    'tr_TR': {
      "button_lang" : "TR",
      'login_kullanıcıadı': 'Kullanıcı Adı',
      'login_şifre': 'Şifre',
      'login_şifremiunuttum': 'Şifremi Unuttum',
      'login_girişyap': 'Giriş Yap',
      'login_üyedeğilmisiniz': 'Üye Değil misiniz?',
      'login_kayıtol': 'Kayıt Ol',

      "home_kullanıcı" : "Kullanıcı",
      "home_ayarlar" : "Ayarlar",
      "home_durum" : "Durum",
      "home_ses" : "Ses",
      "home_konum" : "Konum",
      "home_sıcaklıkvenem" : "Sıcaklık ve Nem",
      "home_havadurumu" : "Hava Durumu",
      "home_ağırlık" : "Ağırlık",

      "weather_sıcaklık" : "Sıcaklık",
      "weather_rüzgar" : "Rüzgar",
      "weather_nem" : "Nem"


    }
  };
}