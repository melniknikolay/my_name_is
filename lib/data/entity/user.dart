import 'contacts.dart';
import 'cv.dart';
import 'portfolio.dart';

class User {
  String? externalId;
  String? internalId;
  String? familyName;
  String? firstName;
  String? qr;
  Cv? cv;
  Portfolio? portfolio;
  Contacts? contacts;

  User(
      {this.externalId,
        this.internalId,
        this.familyName,
        this.firstName,
        this.qr,
        this.cv,
        this.portfolio,
        this.contacts});

  User.fromJson(Map<String, dynamic> json) {
    externalId = json['external_id'];
    internalId = json['internal_id'];
    familyName = json['family_name'];
    firstName = json['first_name'];
    qr = json['qr'];
    cv = json['cv'] != null ? Cv.fromJson(json['cv']) : null;
    portfolio = json['portfolio'] != null
        ? Portfolio.fromJson(json['portfolio'])
        : null;
    //TODO изменить на contacts в БД
    contacts =
    json['contact'] != null ? Contacts.fromJson(json['contact']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['external_id'] = externalId;
    data['internal_id'] = internalId;
    data['family_name'] = familyName;
    data['first_name'] = firstName;
    data['qr'] = qr;
    if (cv != null) {
      data['cv'] = cv!.toJson();
    }
    if (portfolio != null) {
      data['portfolio'] = portfolio!.toJson();
    }
    if (contacts != null) {
      data['contact'] = contacts!.toJson();
    }
    return data;
  }
}