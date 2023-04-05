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
  String il = " ";
  String ilce = "";
  String ariCins = "";
  String kovanCins = "";
  List<String> bosList = [""];
  List<String> ilList = ["Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Aksaray", "Amasya", "Ankara", "Antalya", "Ardahan", "Artvin", "Aydın", "Balıkesir", "Bartın", "Batman", "Bayburt", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Düzce", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkâri", "Hatay", "Iğdır", "Isparta", "İstanbul", "İzmir", "Kahramanmaraş", "Karabük", "Karaman", "Kars", "Kastamonu", "Kayseri", "Kilis", "Kırıkkale", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Mardin", "Mersin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Osmaniye", "Rize", "Sakarya", "Samsun", "Şanlıurfa", "Siirt", "Sinop", "Sivas", "Şırnak", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Uşak", "Van", "Yalova", "Yozgat", "Zonguldak"];

  var ilceList = {
    " " : [""],
    "Ankara": ["Altındağ", "Ayaş", "Bala", "Beypazarı", "Çamlıdere", "Çankaya", "Çubuk", "Etimesgut", "Haymana", "Kalecik", "Keçiören", "Kızılcahamam", "Mamak", "Nallıhan", "Polatlı", "Şereflikoçhisar", "Sincan", "Yenimahalle"],
    "İstanbul": ["Adalar", "Bağcılar", "Bahçelievler", "Bakırköy", "Beşiktaş", "Beykoz", "Beyoğlu", "Büyükçekmece", "Çatalca", "Eminönü", "Esenler", "Eyüp", "Fatih", "Gaziosmanpaşa", "Güngören", "Kadıköy", "Kağıthane", "Kartal", "Küçükçekmece", "Maltepe", "Pendik", "Sarıyer", "Silivri", "Şile", "Şişli", "Sultanbeyli", "Tuzla", "Ümraniye", "Üsküdar", "Zeytinburnu"],
    "İzmir": ["Aliağa", "Balçova", "Bayındır", "Bergama", "Beydağ", "Bornova", "Buca", "Çeşme", "Dikili", "Foça", "Güzelbahçe", "Karaburun", "Karşıyaka", "Kemalpaşa", "Kınık", "Kiraz", "Konak", "Menderes", "Menemen", "Narlıdere", "Ödemiş", "Seferihisar", "Selçuk", "Tire", "Torbalı", "Urla"],
    "Adana": ["Aladağ", "Ceyhan", "Feke", "Karaisalı", "Kozan", "Pozantı", "Saimbeyli", "Seyhan", "Yumurtalı", "Yüreğir"],
    "Adıyaman": ["Besni", "Gölbaşı", "Kahta", "Merkez"],
    "Afyon": ["Başmakçı", "Bolvadin", "Çay", "Çobanlar", "Dinar", "Emirdağ", "İhsaniye", "Kızılören", "Merkez", "Sandıklı", "Sincanlı", "Suhut", "Sultandağı"],
    "Ağrı": ["Diyadin", "Doğubeyazıt", "Merkez", "Patnos", "Tutak"],
    "Aksaray": ["Eskil", "Gülağaç", "Güzelyurt", "Merkez"],
    "Amasya": ["Göynücek", "Gümüşhacıköy", "Merkez", "Merzifon", "Suluova", "Taşova"],
    "Antalya": ["Akseki", "Alanya", "Elmalı", "Finike", "Gazipaşa", "İbradi", "Kale", "Kaş", "Korkuteli", "Kumluca", "Manavgat", "Merkez", "Serik"],
    "Ardahan": ["Çıldır", "Göle", "Merkez"],
    "Artvin": ["Ardanuc", "Arhavi", "Hopa", "Merkez", "Murgül", "Savsat", "Yusufeli"],
    "Aydın": ["Bozdoğan", "Buharkent", "Çine", "Germencik", "İncirliova", "Karacasu", "Karpuzlu", "Koçarlı", "Köşk", "Kuşadası", "Kuyucak", "Merkez", "Nazilli", "Söke", "Sultanhisar", "Yenihisar", "Yenipazar"],
    "Balıkesir": ["Ayvalık", "Balya", "Bandırma", "Bigadiç", "Burhaniye", "Dursunbey", "Edremit", "Erdek", "Gömeç", "Gönen", "Havran", "İvrindi", "Kepsut", "Manyas", "Merkez", "Savaştepe", "Sındırgı", "Susurluk"],
    "Bartın": ["Amasra", "Merkez", "Ulus"],
    "Batman": ["Hasankeyf", "Merkez"],
    "Bayburt": ["Aydıntepe", "Demirözü", "Merkez"],
    "Bilecek": ["Bozhüyük", "Gölpazarı", "Merkez", "Osmaneli", "Pazaryeri", "Söğüt"],
    "Bingöl": ["Adaklı", "Genç", "Karlıova", "Kiğı", "Merkez", "Solhan", "Yayladere", "Yedisu"],
    "Bitlis": ["Adilcevaz", "Ahlat", "Güloymak", "Merkez", "Mutki", "Tatvan"],
    "Bolu": ["Dörtdivan", "Gerede", "Göynük", "Mengen", "Merkez", "Mudurnu", "Yeniçağa"],
    "Burdur": ["Ağlasun", "Bucak", "Çavdır", "Gölhisar", "Karamanlı", "Merkez", "Tefenni", "Yeşilova"],
    "Bursa": ["Gemlik", "Gürsu", "İnegöl", "İznik", "Karacabey", "Keleş", "Kestel", "Mudanya", "MustafaKemalPaşa", "Nilüfer", "Orhaneli", "Orhangazi", "Osmangazi", "Yenişehir", "Yıldırım"],
    "Çanakkale": ["Ayvacık", "Bayramiç", "Biga", "Bozcaada", "Çan", "Eceabat", "Ezine", "Gölbaşı", "Gökçeada", "Lapseki", "Merkez", "Yenice"],
    "Çankırı": ["Atkaracalar", "Bayramören", "Çerkeş", "Eldivan", "Ilgaz", "Kurşunlu", "Merkez", "Orta", "Şabanözü", "Yapraklı"],
    "Çorum": ["Alaca", "Boğazkale", "Iskılıp", "Kargı", "Mecitözü", "Merkez", "Oğuzlar", "Osmancık", "Sungurlu", "Uğurludağ"],
    "Denizli": ["Acıpayam", "Babadağ", "Buldan", "Çal", "Çardak", "Çivril", "Güney", "Holaz", "Kale", "Merkez", "Sarayköy", "Tavaş"],
    "Diyarbakır": ["Çermik", "Eğil", "Ergani", "Hani", "Hazro", "Kocaköy", "Lice", "Merkez", "Silvan"],
    "Düzce": ["Akçakoca", "Çilimli", "Merkez", "Yığılca"],
    "Edirne": ["Enes", "Havsa", "İpsala", "Keşan", "Lalapaşa", "Meriç", "Merkez", "Uzunköprü"],
    "Elazığ": ["Ağin", "Arıcak", "Baskıl", "Karakoçan", "Keban", "Kovancılar", "Maden", "Merkez", "Palu", "Sivrice"],
    "Erzincan": ["Çayırlı", "Ilıç", "Kemah", "Kemaliye", "Merkez", "Refahiye", "Tercan", "Üzümlü"],
    "Erzurum": ["Aşkale", "Hınıs", "Horasan", "Ilıca", "İspir", "Narman", "Oltu", "Olur", "Pasinler", "Tortum"],
    "Eskişehir": ["Alpu", "Beylikova", "Çifteler", "Günyüzü", "Han", "İnönü", "Mahmudiye", "Merkez", "Mihalıçcık", "Seyitgazi", "Sivrihisar"],
    "Gaziantep": ["Araban", "Islahiye", "Nizip", "Nurdağı", "Oğuzeli", "Şahinbey", "Şehitkamil", "Yavuzeli"],
    "Giresun": ["Alucra", "Bulancak", "Dereli", "Espiye", "Eynesil", "Görele", "Keşap", "Merkez", "Şebinkarahisar", "Tirebolu"],
    "Gümüşhane": ["Kelkit", "Kurtun", "Merkez", "Şiran"],
    "Hakkari": ["Çukurca", "Merkez", "Şemdilli", "Yüksekova"],
    "Hatay": ["Altınözü", "Belen", "Dörtyol", "Yüksekova", "Erzin", "İskenderun", "Kırıkhan", "Kumlu", "Merkez", "Reyhanlı", "Samandağı", "Yayladağı"],
    "Iğdır": ["Aralık", "Karakoyunlu", "Merkez", "Tuzluca"],
    "Isparta": ["Aksu", "Atabey", "Eğirdir", "Gelendost", "Gönen", "Keçiborlu", "Merkez", "Sarkıkaraağaç", "Senirkent", "Sütçüler", "Uluborlu", "Yalvaç"],
    "Kahramanmaraş": ["Afşın", "Andırın", "Çağlayancerit", "Elbistan", "Göksun", "Merkez", "Pazarcık"],
    "Karabük": ["Eskipazar", "Merkez", "Safranbolu"],
    "Karaman": ["Ayrancı", "Başyayla", "Ermenek", "Merkez"],
    "Kars": ["Kağızman", "Merkez", "Sarıkamış"],
    "Kastamonu": ["Abana", "Arac", "Bozkurt", "Çatalzeytin", "Cide", "Daday", "Devrenkanı", "Hanönü", "İhsangazi", "İnebolu", "Küre", "Merkez", "Taşköprü", "Tosya"],
    "Kayseri": ["Akkışla", "Bünyan", "Develi", "Felahiye", "Hacılar", "İncesu", "Kocasinan", "Melekgazi", "Özvatan", "Pınarbaşı", "Talas", "Tomarza", "Yahyalı", "Yeşilhisar"],
    "Kilis": ["Elbeyli", "Merkez", "Musabeyli", "Polateli"],
    "Kırıkkale": ["Karakeçili", "Keskin", "Merkez", "Sulakyurt"],
    "Kırklareli": ["Babaski", "Lüleburgaz", "Merkez", "Pehlivanköy", "Pınarhisar", "Vize"],
    "Kırşehir": ["Akpınar", "Çiçekdağı", "Kaman", "Merkez", "Mucur"],
    "Kocaeli": ["Derince", "Gebze", "Gölcük", "Kandıra", "Karamürsel", "Merkez"],
    "Konya": ["Akören", "Akşehir", "Altınekin", "Beyşehir", "Bozkır", "Çeltik", "Cihanbeyli", "Çumra", "Derbent", "Doğanhisar", "Emirgazi", "Ereğli", "Hadım", "Hüyük", "Ilgın", "Kadınhanı", "Karapınar", "Karatay", "Meram", "Sarayönü", "Selçuklu", "Seydişehir", "Taşkent", "Yunak"],
    "Kütahya": ["Altıntaş", "Domaniç", "Dumlupınar", "Emet", "Gediz", "Merkez", "Pazarlar", "Simav", "Tavşanlı"],
    "Malatya": ["Akçadağ", "Arapkır", "Arguvan", "Battalgazi", "Darende", "Doğanşehir", "Hekimhan", "Merkez", "Pötürge", "Yazıhan", "Yeşilhan"],
    "Manisa": ["Ahmetli", "Akhisar", "Alaşehir", "Demirci", "Gölmarmara", "Gördes", "Kırkağaç", "Kula", "Merkez", "Salihli", "Sarıhanlı", "Soma", "Turgutlu"],
    "Mardin": ["Derik", "Kızıltepe", "Mazıdağı", "Merkez", "Midyat", "Nusaybin", "Ömerli", "Savur"],
    "Mersin": ["Anamur", "Bozyazı", "Çamlıyayla", "Erdemli", "Gülnar", "Merkez", "Mut", "Silifke", "Tarsus"],
    "Muğla": ["Bodrum", "Datça", "Fathiye", "Kavaklıdere", "Köyceğiz", "Marmaris", "Merkez", "Milas", "Ortaca", "Ula", "Yatağan"],
    "Muş": ["Bulanık", "Korkut", "Malazgirt", "Merkez"],
    "Nevşehir": ["Avanos", "Derinkuyu", "Gülşehir", "Hacıbektaş", "Kozaklı", "Merkez", "Ürgüp"],
    "Niğde": ["Altunhisar", "Bor", "Çamardı", "Çiftlik", "Ulukışla"],
    "Ordu": ["Akkuş", "Fatsa", "Görköy", "Kabadüz", "Merkez", "Mesudiye", "Perşembe", "Ulubey", "Ünye"],
    "Osmaniye": ["Bahçe", "Kadirli", "Merkez"],
    "Rize": ["Ardeşen", "Çayeli", "Fındıklı", "Merkez", "Pazar", "Çamlıhemşin"],
    "Sakarya": ["Akyazı", "Geyve", "Hendek", "Karasu", "Kaynarca", "Merkez", "Sapanca", "Taraklı"],
    "Samsun": ["Alaçam", "Bafra", "Çarşamba", "Havza", "Kavak", "Ladik", "Merkez", "Salıpazarı", "Tekkeköy", "Terme", "Vezirköprü"],
    "Şanlıurfa": ["Akçakale", "Birecik", "Bozova", "Halfeti", "Harran", "Hilvan", "Merkez", "Siverek", "Suruç", "Viranşehir"],
    "Siirt": ["Aydınlar", "Baykan", "Eruh", "Kurtalan", "Merkez"],
    "Sinop": ["Ayancık", "Boyabat", "Durağan", "Elfelek", "Gerze", "Merkez"],
    "Şırnak": ["Cizre", "İdil", "Merkez", "Silopi"],
    "Sivas": ["Altınyayla", "Divriği", "Doğansar", "Gemerek", "Hafik", "Kangal", "Merkez", "Şarkışla", "Suşehri", "Yılızeli", "Zara"],
    "Tekirdağ": ["Çerkezköy", "Çorlu", "Hayrabolu", "Malkara", "MarmaraEreğlisi", "Merkez", "Muratlı", "Saray", "Şarköy"],
    "Tokat": ["Almuz", "Erbaa", "Merkez", "Niksar", "Pazar", "Reşadiye", "Sulusaray", "Turhal", "Zile"],
    "Trabzon": ["Akçabat", "Araklı", "Arşin", "Beşikdüzü", "Çarşıbaşı", "Çaykara", "Dernekpazarı", "Maçka", "Merkez", "Of", "Sürmene", "Tonya", "Vakfıkebir", "Yomra"],
    "Tunceli": ["Çemişgezek", "Hozat", "Mazgirt", "Merkez", "Nazimiye", "Pertek"],
    "Uşak": ["Banaz", "Eşme", "Merkez", "Sivaslı", "Ulubey"],
    "Van": ["Başkale", "Çaldıran", "Çatak", "Erciş", "Gevaş", "Gürpınar", "Merkez", "Muradiye", "Özalp"],
    "Yalova": ["Altınova", "Armutlu", "Merkez"],
    "Yozgat": ["Boğazlıyan", "Çandır", "Çayıralan", "Merkez", "Sarıkaya", "Sefaatli", "Sorgun", "Yenifakili", "Yerköy"],
    "Zonguldak": ["Araplı", "Çaycuma", "Devrek", "Ereğli", "Merkez"],
  };




  Future<String?> _authUser(LoginData loginData) async {


    try {
      ht.Response response = await post(
          Uri.parse("https://reqres.in/api/login"),


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

      _showMaterialDialog();
      RegExp regex = RegExp(r'^(?=.*?).{8,}$');
      if (!regex.hasMatch(data.password!)) {
      Get.back();

        return "şifreuyarı8".tr;
      }
      Get.back();
      //Get.snackbar("Uyarı", data.toString());
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
                        setState(() {
                          il = item!;
                          bosList.clear();
                          bosList.addAll(ilceList[item] as Iterable<String>);
                        });
                      },
                      searchBoxDecoration: InputDecoration(
                        hintText: "ara".tr,
                      ),

                    ),
                    FindDropdown(
                      items: bosList,
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
                      //Get.snackbar("Uyarı", kovanCins+ariCins+il+ilce);

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
        hideForgotPasswordButton: true,

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
