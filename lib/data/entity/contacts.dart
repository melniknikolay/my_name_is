class Contacts {
  String? dribbble;
  String? email;
  String? facebook;
  String? git;
  String? instagram;
  String? linkid;
  String? phone;
  String? pinterest;
  String? telegram;
  String? whatsapp;

  Contacts(
    this.dribbble,
    this.email,
    this.facebook,
    this.git,
    this.instagram,
    this.linkid,
    this.phone,
    this.pinterest,
    this.telegram,
    this.whatsapp,
  );

  Contacts.fromJson(Map<String, dynamic> json) {
    dribbble = json['dribbble'];
    email = json['email'];
    facebook = json['facebook'];
    git = json['git'];
    instagram = json['instagram'];
    linkid = json['linkid'];
    phone = json['phone'];
    pinterest = json['pinterest'];
    telegram = json['telegram'];
    whatsapp = json['whatsapp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['dribbble'] = dribbble;
    data['email'] = email;
    data['facebook'] = facebook;
    data['git'] = git;
    data['instagram'] = instagram;
    data['linkid'] = linkid;
    data['phone'] = phone;
    data['pinterest'] = pinterest;
    data['telegram'] = telegram;
    data['whatsapp'] = whatsapp;
    return data;
  }
}
