class User {
  String? tc;
  String? adi;
  String? soyadi;
  String? isletmeNo;
  String? cepTelefon;
  String? username;
  String? password;
  String? adres;
  String? il;
  String? ilce;
  KovanBilgi? kovanBilgi;

  User(
      {this.tc,
        this.adi,
        this.soyadi,
        this.isletmeNo,
        this.cepTelefon,
        this.username,
        this.password,
        this.adres,
        this.il,
        this.ilce,
        this.kovanBilgi});

  User.fromJson(Map<String, dynamic> json) {
    tc = json['tc'];
    adi = json['adi'];
    soyadi = json['soyadi'];
    isletmeNo = json['isletme_no'];
    cepTelefon = json['cep_telefon'];
    username = json['username'];
    password = json['password'];
    adres = json['adres'];
    il = json['il'];
    ilce = json['ilce'];
    kovanBilgi = json['kovanBilgi'] != null
        ? new KovanBilgi.fromJson(json['kovanBilgi'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tc'] = this.tc;
    data['adi'] = this.adi;
    data['soyadi'] = this.soyadi;
    data['isletme_no'] = this.isletmeNo;
    data['cep_telefon'] = this.cepTelefon;
    data['username'] = this.username;
    data['password'] = this.password;
    data['adres'] = this.adres;
    data['il'] = this.il;
    data['ilce'] = this.ilce;
    if (this.kovanBilgi != null) {
      data['kovanBilgi'] = this.kovanBilgi!.toJson();
    }
    return data;
  }
}

class KovanBilgi {
  String? seriNO;
  int? sicaklik;
  int? nem;
  String? konum;
  int? ses;
  String? hareket;
  int? havaKalitesi;
  String? baglanti;
  int? agirlik;
  String? kamera;

  KovanBilgi(
      {this.seriNO,
        this.sicaklik,
        this.nem,
        this.konum,
        this.ses,
        this.hareket,
        this.havaKalitesi,
        this.baglanti,
        this.agirlik,
        this.kamera});

  KovanBilgi.fromJson(Map<String, dynamic> json) {
    seriNO = json['seriNO'];
    sicaklik = json['sicaklik'];
    nem = json['nem'];
    konum = json['konum'];
    ses = json['ses'];
    hareket = json['hareket'];
    havaKalitesi = json['havaKalitesi'];
    baglanti = json['baglanti'];
    agirlik = json['agirlik'];
    kamera = json['kamera'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seriNO'] = this.seriNO;
    data['sicaklik'] = this.sicaklik;
    data['nem'] = this.nem;
    data['konum'] = this.konum;
    data['ses'] = this.ses;
    data['hareket'] = this.hareket;
    data['havaKalitesi'] = this.havaKalitesi;
    data['baglanti'] = this.baglanti;
    data['agirlik'] = this.agirlik;
    data['kamera'] = this.kamera;
    return data;
  }
}
