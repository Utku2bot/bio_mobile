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
  var ilceList = ["ADALAR", "ARNAVUTKÖY", "ATAŞEHİR", "AVCILAR", "BAĞCILAR", "BAHÇELİEVLER", "BAKIRKÖY", "BAŞAKŞEHİR", "BAYRAMPAŞA", "BEŞİKTAŞ", "BEYKOZ", "BEYLİKDÜZÜ", "BEYOĞLU", "BÜYÜKÇEKMECE", "ÇATALCA", "ÇEKMEKÖY", "ESENLER", "ESENYURT", "EYÜP", "FATİH", "GAZİOSMANPAŞA", "GÜNGÖREN", "KADIKÖY", "KAĞITHANE", "KARTAL", "KÜÇÜKÇEKMECE", "MALTEPE", "PENDİK", "SANCAKTEPE", "SARIYER", "SİLİVRİ", "SULTANBEYLİ", "SULTANGAZİ", "ŞİLE", "ŞİŞLİ", "TUZLA", "ÜMRANİYE", "ÜSKÜDAR", "ZEYTİNBURNU", "AKYURT", "ALTINDAĞ", "AYAŞ", "BALA", "BEYPAZARI", "ÇAMLIDERE", "ÇANKAYA", "ÇUBUK", "ELMADAĞ", "ETİMESGUT", "EVREN", "GÖLBAŞI", "GÜDÜL", "HAYMANA", "KAHRAMANKAZAN", "KALECİK", "KEÇİÖREN", "KIZILCAHAMAM", "MAMAK", "NALLIHAN", "POLATLI", "PURSAKLAR", "SİNCAN", "ŞEREFLİKOÇHİSAR", "YENİMAHALLE", "ALİAĞA", "BALÇOVA", "BAYINDIR", "BAYRAKLI", "BERGAMA", "BEYDAĞ", "BORNOVA", "BUCA", "ÇEŞME", "ÇİĞLİ", "DİKİLİ", "FOÇA", "GAZİEMİR", "GÜZELBAHÇE", "KARABAĞLAR", "KARABURUN", "KARŞIYAKA", "KEMALPAŞA", "KINIK", "KİRAZ", "KONAK", "MENDERES", "MENEMEN", "NARLIDERE", "ÖDEMİŞ", "SEFERİHİSAR", "SELÇUK", "TİRE", "TORBALI", "URLA", "BÜYÜKORHAN", "GEMLİK", "GÜRSU", "HARMANCIK", "İNEGÖL", "İZNİK", "KARACABEY", "KELES", "KESTEL", "MUDANYA", "MUSTAFAKEMALPAŞA", "NİLÜFER", "ORHANELİ", "ORHANGAZİ", "OSMANGAZİ", "YENİŞEHİR", "YILDIRIM", "ALADAĞ", "CEYHAN", "ÇUKUROVA", "FEKE", "İMAMOĞLU", "KARAİSALI", "KARATAŞ", "KOZAN", "POZANTI", "SAİMBEYLİ", "SARIÇAM", "SEYHAN", "TUFANBEYLİ", "YUMURTALIK", "YÜREĞİR", "BESNİ", "ÇELİKHAN", "GERGER", "GÖLBAŞI", "KAHTA", "MERKEZ", "SAMSAT", "SİNCİK", "TUT", "BAŞMAKÇI", "BAYAT", "BOLVADİN", "ÇAY", "ÇOBANLAR", "DAZKIRI", "DİNAR", "EMİRDAĞ", "EVCİLER", "HOCALAR", "İHSANİYE", "İSCEHİSAR", "KIZILÖREN", "MERKEZ", "SANDIKLI", "SİNANPAŞA", "SULTANDAĞI", "ŞUHUT", "DİYADİN", "DOĞUBAYAZIT", "ELEŞKİRT", "HAMUR", "MERKEZ", "PATNOS", "TAŞLIÇAY", "TUTAK", "AĞAÇÖREN", "ESKİL", "GÜLAĞAÇ", "GÜZELYURT", "MERKEZ", "ORTAKÖY", "SARIYAHŞİ", "GÖYNÜCEK", "GÜMÜŞHACIKÖY", "HAMAMÖZÜ", "MERKEZ", "MERZİFON", "SULUOVA", "TAŞOVA", "AKSEKİ", "AKSU", "ALANYA", "DEMRE", "DÖŞEMEALTI", "ELMALI", "FİNİKE", "GAZİPAŞA", "GÜNDOĞMUŞ", "İBRADI", "KAŞ", "KEMER", "KEPEZ", "KONYAALTI", "KORKUTELİ", "KUMLUCA", "MANAVGAT", "MURATPAŞA", "SERİK", "ÇILDIR", "DAMAL", "GÖLE", "HANAK", "MERKEZ", "POSOF", "ARDANUÇ", "ARHAVİ", "BORÇKA", "HOPA", "MERKEZ", "MURGUL", "ŞAVŞAT", "YUSUFELİ", "BOZDOĞAN", "BUHARKENT", "ÇİNE", "DİDİM", "EFELER", "GERMENCİK", "İNCİRLİOVA", "KARACASU", "KARPUZLU", "KOÇARLI", "KÖŞK", "KUŞADASI", "KUYUCAK", "NAZİLLİ", "SÖKE", "SULTANHİSAR", "YENİPAZAR", "ALTIEYLÜL", "AYVALIK", "BALYA", "BANDIRMA", "BİGADİÇ", "BURHANİYE", "DURSUNBEY", "EDREMİT", "ERDEK", "GÖMEÇ", "GÖNEN", "HAVRAN", "İVRİNDİ", "KARESİ", "KEPSUT", "MANYAS", "MARMARA", "SAVAŞTEPE", "SINDIRGI", "SUSURLUK", "AMASRA", "KURUCAŞİLE", "MERKEZ", "ULUS", "BEŞİRİ", "GERCÜŞ", "HASANKEYF", "KOZLUK", "MERKEZ", "SASON", "AYDINTEPE", "DEMİRÖZÜ", "MERKEZ", "BOZÜYÜK", "GÖLPAZARI", "İNHİSAR", "MERKEZ", "OSMANELİ", "PAZARYERİ", "SÖĞÜT", "YENİPAZAR", "ADAKLI", "GENÇ", "KARLIOVA", "KİĞI", "MERKEZ", "SOLHAN", "YAYLADERE", "YEDİSU", "ADİLCEVAZ", "AHLAT", "GÜROYMAK", "HİZAN", "MERKEZ", "MUTKİ", "TATVAN", "DÖRTDİVAN", "GEREDE", "GÖYNÜK", "KIBRISCIK", "MENGEN", "MERKEZ", "MUDURNU", "SEBEN", "YENİÇAĞA", "AĞLASUN", "ALTINYAYLA", "BUCAK", "ÇAVDIR", "ÇELTİKÇİ", "GÖLHİSAR", "KARAMANLI", "KEMER", "MERKEZ", "TEFENNİ", "YEŞİLOVA", "AYVACIK", "BAYRAMİÇ", "BİGA", "BOZCAADA", "ÇAN", "ECEABAT", "EZİNE", "GELİBOLU", "GÖKÇEADA", "LAPSEKİ", "MERKEZ", "YENİCE", "ATKARACALAR", "BAYRAMÖREN", "ÇERKEŞ", "ELDİVAN", "ILGAZ", "KIZILIRMAK", "KORGUN", "KURŞUNLU", "MERKEZ", "ORTA", "ŞABANÖZÜ", "YAPRAKLI", "ALACA", "BAYAT", "BOĞAZKALE", "DODURGA", "İSKİLİP", "KARGI", "LAÇİN", "MECİTÖZÜ", "MERKEZ", "OĞUZLAR", "ORTAKÖY", "OSMANCIK", "SUNGURLU", "UĞURLUDAĞ", "ACIPAYAM", "BABADAĞ", "BAKLAN", "BEKİLLİ", "BEYAĞAÇ", "BOZKURT", "BULDAN", "ÇAL", "ÇAMELİ", "ÇARDAK", "ÇİVRİL", "GÜNEY", "HONAZ", "KALE", "MERKEZEFENDİ", "PAMUKKALE", "SARAYKÖY", "SERİNHİSAR", "TAVAS", "BAĞLAR", "BİSMİL", "ÇERMİK", "ÇINAR", "ÇÜNGÜŞ", "DİCLE", "EĞİL", "ERGANİ", "HANİ", "HAZRO", "KAYAPINAR", "KOCAKÖY", "KULP", "LİCE", "SİLVAN", "SUR", "YENİŞEHİR", "BAŞİSKELE", "ÇAYIROVA", "DARICA", "DERİNCE", "DİLOVASI", "GEBZE", "GÖLCÜK", "İZMİT", "KANDIRA", "KARAMÜRSEL", "KARTEPE", "KÖRFEZ", "AHIRLI", "AKÖREN", "AKŞEHİR", "ALTINEKİN", "BEYŞEHİR", "BOZKIR", "CİHANBEYLİ", "ÇELTİK", "ÇUMRA", "DERBENT", "DEREBUCAK", "DOĞANHİSAR", "EMİRGAZİ", "EREĞLİ", "GÜNEYSINIR", "HADİM", "HALKAPINAR", "HÜYÜK", "ILGIN", "KADINHANI", "KARAPINAR", "KARATAY", "KULU", "MERAM", "SARAYÖNÜ", "SELÇUKLU", "SEYDİŞEHİR", "TAŞKENT", "TUZLUKÇU", "YALIHÜYÜK", "YUNAK", "ALTINTAŞ", "ASLANAPA", "ÇAVDARHİSAR", "DOMANİÇ", "DUMLUPINAR", "EMET", "GEDİZ", "HİSARCIK", "MERKEZ", "PAZARLAR", "SİMAV", "ŞAPHANE", "TAVŞANLI", "AKÇADAĞ", "ARAPGİR", "ARGUVAN", "BATTALGAZİ", "DARENDE", "DOĞANŞEHİR", "DOĞANYOL", "HEKİMHAN", "KALE", "KULUNCAK", "PÜTÜRGE", "YAZIHAN", "YEŞİLYURT", "AHMETLİ", "AKHİSAR", "ALAŞEHİR", "DEMİRCİ", "GÖLMARMARA", "GÖRDES", "KIRKAĞAÇ", "KÖPRÜBAŞI", "KULA", "SALİHLİ", "SARIGÖL", "SARUHANLI", "SELENDİ", "SOMA", "ŞEHZADELER", "TURGUTLU", "YUNUSEMRE", "ARTUKLU", "DARGEÇİT", "DERİK", "KIZILTEPE", "MAZIDAĞI", "MİDYAT", "NUSAYBİN", "ÖMERLİ", "SAVUR", "YEŞİLLİ", "AKDENİZ", "ANAMUR", "AYDINCIK", "BOZYAZI", "ÇAMLIYAYLA", "ERDEMLİ", "GÜLNAR", "MEZİTLİ", "MUT", "SİLİFKE", "TARSUS", "TOROSLAR", "YENİŞEHİR", "BODRUM", "DALAMAN", "DATÇA", "FETHİYE", "KAVAKLIDERE", "KÖYCEĞİZ", "MARMARİS", "MENTEŞE", "MİLAS", "ORTACA", "SEYDİKEMER", "ULA", "YATAĞAN", "BULANIK", "HASKÖY", "KORKUT", "MALAZGİRT", "MERKEZ", "VARTO", "ACIGÖL", "AVANOS", "DERİNKUYU", "GÜLŞEHİR", "HACIBEKTAŞ", "KOZAKLI", "MERKEZ", "ÜRGÜP", "ALTUNHİSAR", "BOR", "ÇAMARDI", "ÇİFTLİK", "MERKEZ", "ULUKIŞLA", "AKKUŞ", "ALTINORDU", "AYBASTI", "ÇAMAŞ", "ÇATALPINAR", "ÇAYBAŞI", "FATSA", "GÖLKÖY", "GÜLYALI", "GÜRGENTEPE", "İKİZCE", "KABADÜZ", "KABATAŞ", "KORGAN", "KUMRU", "MESUDİYE", "PERŞEMBE", "ULUBEY", "ÜNYE", "BAHÇE", "DÜZİÇİ", "HASANBEYLİ", "KADİRLİ", "MERKEZ", "SUMBAS", "TOPRAKKALE", "ARDEŞEN", "ÇAMLIHEMŞİN", "ÇAYELİ", "DEREPAZARI", "FINDIKLI", "GÜNEYSU", "HEMŞİN", "İKİZDERE", "İYİDERE", "KALKANDERE", "MERKEZ", "PAZAR", "ADAPAZARI", "AKYAZI", "ARİFİYE", "ERENLER", "FERİZLİ", "GEYVE", "HENDEK", "KARAPÜRÇEK", "KARASU", "KAYNARCA", "KOCAALİ", "PAMUKOVA", "SAPANCA", "SERDİVAN", "SÖĞÜTLÜ", "TARAKLI", "ALAÇAM", "ASARCIK", "ATAKUM", "AYVACIK", "BAFRA", "CANİK", "ÇARŞAMBA", "HAVZA", "İLKADIM", "KAVAK", "LADİK", "SALIPAZARI", "TEKKEKÖY", "TERME", "VEZİRKÖPRÜ", "YAKAKENT", "19 MAYIS", "BAYKAN", "ERUH", "KURTALAN", "MERKEZ", "PERVARİ", "ŞİRVAN", "TİLLO", "AYANCIK", "BOYABAT", "DİKMEN", "DURAĞAN", "ERFELEK", "GERZE", "MERKEZ", "SARAYDÜZÜ", "TÜRKELİ", "BEYTÜŞŞEBAP", "CİZRE", "GÜÇLÜKONAK", "İDİL", "MERKEZ", "SİLOPİ", "ULUDERE", "AKINCILAR", "ALTINYAYLA", "DİVRİĞİ", "DOĞANŞAR", "GEMEREK", "GÖLOVA", "GÜRÜN", "HAFİK", "İMRANLI", "KANGAL", "KOYULHİSAR", "MERKEZ", "SUŞEHRİ", "ŞARKIŞLA", "ULAŞ", "YILDIZELİ", "ZARA", "ÇERKEZKÖY", "ÇORLU", "ERGENE", "HAYRABOLU", "KAPAKLI", "MALKARA", "MARMARAEREĞLİSİ", "MURATLI", "SARAY", "SÜLEYMANPAŞA", "ŞARKÖY", "ALMUS", "ARTOVA", "BAŞÇİFTLİK", "ERBAA", "MERKEZ", "NİKSAR", "PAZAR", "REŞADİYE", "SULUSARAY", "TURHAL", "YEŞİLYURT", "ZİLE", "AKÇAABAT", "ARAKLI", "ARSİN", "BEŞİKDÜZÜ", "ÇARŞIBAŞI", "ÇAYKARA", "DERNEKPAZARI", "DÜZKÖY", "HAYRAT", "KÖPRÜBAŞI", "MAÇKA", "OF", "ORTAHİSAR", "SÜRMENE", "ŞALPAZARI", "TONYA", "VAKFIKEBİR", "YOMRA", "ÇEMİŞGEZEK", "HOZAT", "MAZGİRT", "MERKEZ", "NAZIMİYE", "OVACIK", "PERTEK", "PÜLÜMÜR", "AKÇAKALE", "BİRECİK", "BOZOVA", "CEYLANPINAR", "EYYÜBİYE", "HALFETİ", "HALİLİYE", "HARRAN", "HİLVAN", "KARAKÖPRÜ", "SİVEREK", "SURUÇ", "VİRANŞEHİR", "BANAZ", "EŞME", "KARAHALLI", "MERKEZ", "SİVASLI", "ULUBEY", "BAHÇESARAY", "BAŞKALE", "ÇALDIRAN", "ÇATAK", "EDREMİT", "ERCİŞ", "GEVAŞ", "GÜRPINAR", "İPEKYOLU", "MURADİYE", "ÖZALP", "SARAY", "TUŞBA", "ALTINOVA", "ARMUTLU", "ÇINARCIK", "ÇİFTLİKKÖY", "MERKEZ", "TERMAL", "AKDAĞMADENİ", "AYDINCIK", "BOĞAZLIYAN", "ÇANDIR", "ÇAYIRALAN", "ÇEKEREK", "KADIŞEHRİ", "MERKEZ", "SARAYKENT", "SARIKAYA", "SORGUN", "ŞEFAATLİ", "YENİFAKILI", "YERKÖY", "ALAPLI", "ÇAYCUMA", "DEVREK", "EREĞLİ", "GÖKÇEBEY", "KİLİMLİ", "KOZLU", "MERKEZ", "AKÇAKOCA", "CUMAYERİ", "ÇİLİMLİ", "GÖLYAKA", "GÜMÜŞOVA", "KAYNAŞLI", "MERKEZ", "YIĞILCA", "ENEZ", "HAVSA", "İPSALA", "KEŞAN", "LALAPAŞA", "MERİÇ", "MERKEZ", "SÜLOĞLU", "UZUNKÖPRÜ", "AĞIN", "ALACAKAYA", "ARICAK", "BASKİL", "KARAKOÇAN", "KEBAN", "KOVANCILAR", "MADEN", "MERKEZ", "PALU", "SİVRİCE", "ÇAYIRLI", "İLİÇ", "KEMAH", "KEMALİYE", "MERKEZ", "OTLUKBELİ", "REFAHİYE", "TERCAN", "ÜZÜMLÜ", "AŞKALE", "AZİZİYE", "ÇAT", "HINIS", "HORASAN", "İSPİR", "KARAÇOBAN", "KARAYAZI", "KÖPRÜKÖY", "NARMAN", "OLTU", "OLUR", "PALANDÖKEN", "PASİNLER", "PAZARYOLU", "ŞENKAYA", "TEKMAN", "TORTUM", "UZUNDERE", "YAKUTİYE", "ALPU", "BEYLİKOVA", "ÇİFTELER", "GÜNYÜZÜ", "HAN", "İNÖNÜ", "MAHMUDİYE", "MİHALGAZİ", "MİHALIÇÇIK", "ODUNPAZARI", "SARICAKAYA", "SEYİTGAZİ", "SİVRİHİSAR", "TEPEBAŞI", "ARABAN", "İSLAHİYE", "KARKAMIŞ", "NİZİP", "NURDAĞI", "OĞUZELİ", "ŞAHİNBEY", "ŞEHİTKAMİL", "YAVUZELİ", "ALUCRA", "BULANCAK", "ÇAMOLUK", "ÇANAKÇI", "DERELİ", "DOĞANKENT", "ESPİYE", "EYNESİL", "GÖRELE", "GÜCE", "KEŞAP", "MERKEZ", "PİRAZİZ", "ŞEBİNKARAHİSAR", "TİREBOLU", "YAĞLIDERE", "KELKİT", "KÖSE", "KÜRTÜN", "MERKEZ", "ŞİRAN", "TORUL", "ÇUKURCA", "MERKEZ", "ŞEMDİNLİ", "YÜKSEKOVA", "ALTINÖZÜ", "ANTAKYA", "ARSUZ", "BELEN", "DEFNE", "DÖRTYOL", "ERZİN", "HASSA", "İSKENDERUN", "KIRIKHAN", "KUMLU", "PAYAS", "REYHANLI", "SAMANDAĞ", "YAYLADAĞI", "ARALIK", "KARAKOYUNLU", "MERKEZ", "TUZLUCA", "AKSU", "ATABEY", "EĞİRDİR", "GELENDOST", "GÖNEN", "KEÇİBORLU", "MERKEZ", "SENİRKENT", "SÜTÇÜLER", "ŞARKİKARAAĞAÇ", "ULUBORLU", "YALVAÇ", "YENİŞARBADEMLİ", "AFŞİN", "ANDIRIN", "ÇAĞLAYANCERİT", "DULKADİROĞLU", "EKİNÖZÜ", "ELBİSTAN", "GÖKSUN", "NURHAK", "ONİKİŞUBAT", "PAZARCIK", "TÜRKOĞLU", "EFLANİ", "ESKİPAZAR", "MERKEZ", "OVACIK", "SAFRANBOLU", "YENİCE", "AYRANCI", "BAŞYAYLA", "ERMENEK", "KAZIMKARABEKİR", "MERKEZ", "SARIVELİLER", "AKYAKA", "ARPAÇAY", "DİGOR", "KAĞIZMAN", "MERKEZ", "SARIKAMIŞ", "SELİM", "SUSUZ", "ABANA", "AĞLI", "ARAÇ", "AZDAVAY", "BOZKURT", "CİDE", "ÇATALZEYTİN", "DADAY", "DEVREKANİ", "DOĞANYURT", "HANÖNÜ", "İHSANGAZİ", "İNEBOLU", "KÜRE", "MERKEZ", "PINARBAŞI", "SEYDİLER", "ŞENPAZAR", "TAŞKÖPRÜ", "TOSYA", "AKKIŞLA", "BÜNYAN", "DEVELİ", "FELAHİYE", "HACILAR", "İNCESU", "KOCASİNAN", "MELİKGAZİ", "ÖZVATAN", "PINARBAŞI", "SARIOĞLAN", "SARIZ", "TALAS", "TOMARZA", "YAHYALI", "YEŞİLHİSAR", "ELBEYLİ", "MERKEZ", "MUSABEYLİ", "POLATELİ", "BAHŞİLİ", "BALIŞEYH", "ÇELEBİ", "DELİCE", "KARAKEÇİLİ", "KESKİN", "MERKEZ", "SULAKYURT", "YAHŞİHAN", "BABAESKİ", "DEMİRKÖY", "KOFÇAZ", "LÜLEBURGAZ", "MERKEZ", "PEHLİVANKÖY", "PINARHİSAR", "VİZE", "AKÇAKENT", "AKPINAR", "BOZTEPE", "ÇİÇEKDAĞI", "KAMAN", "MERKEZ", "MUCUR"];
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
                        il = item!;


                      },
                      searchBoxDecoration: InputDecoration(
                        hintText: "ara".tr,
                      ),

                    ),
                    FindDropdown(
                      items: ilceList,
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
