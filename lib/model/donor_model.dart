import 'package:pendiente_frontend_flutter/model/donation_model.dart';

class Donors {
  List<Donor> donorsList = new List();
  Donors.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((d) {
      final donor = new Donor.fromJsonMap(d);
      donorsList.add(donor);
    });
  }
}

class Donor {
  int id;
  String name;
  String lastName;
  String email;
  String password;
  String pathImage;
  String cardHolder;
  String cardNumber;
  int expirationYear;
  int expirationMonth;
  int securityCode;
  int userId;
  int personId;
  int colaborationsQty;
  int followersQty;
  String createdAt;
  String updatedAt;
  Donation lastDonation;

  Donor({
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.password,
    this.pathImage,
    this.cardHolder,
    this.cardNumber,
    this.expirationYear,
    this.expirationMonth,
    this.securityCode,
    this.userId,
    this.personId,
    this.colaborationsQty,
    this.followersQty,
    this.createdAt,
    this.updatedAt,
    this.lastDonation,
  });

  factory Donor.fromJsonMap(Map<String, dynamic> json) => Donor(
        id: json['id'],
        pathImage: json['pathImage'],
        cardHolder: json['cardHolder'],
        cardNumber: json['cardNumber'],
        expirationMonth: json['expirationMonth'],
        expirationYear: json['expirationYear'],
        securityCode: json['securityCode'],
        userId: json['userId'],
        personId: json['personId'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  factory Donor.fromProfileJsonMap(Map<String, dynamic> json) => Donor(
        id: json['id'],
        name: json['name'],
        lastName: json['lastName'],
        pathImage: json['image'],
        email: json['email'],
        cardHolder: json['cardHolder'],
        cardNumber: json['cardNumber'],
        expirationYear: json['expirationYear'],
        expirationMonth: json['expirationMonth'],
        colaborationsQty: json['colaborationsQty'],
        followersQty: json['followersQty'],
        lastDonation: Donation.fromProfileMap(json['lastDonationData']),
      );

  factory Donor.loginInfo(Map<String, dynamic> json) => Donor(
        id: json['id'],
        name: json['name'],
        lastName: json['lastName'],
        email: json['email'],
      );

  List<Donor> getDonorsList(List<dynamic> jsonList) {
    if (jsonList == null) return [];
    List<Donor> donorsList = new List();
    jsonList.forEach((d) {
      final donor = new Donor.fromJsonMap(d);
      donorsList.add(donor);
    });
    return donorsList;
  }

  Map toJson() => {
        'id': id,
        'name': name,
        'lastName': lastName,
        'email': email,
      };
}
