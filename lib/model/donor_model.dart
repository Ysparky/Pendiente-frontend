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
  String pathImage;
  String cardHolder;
  String cardNumber;
  int expirationYear;
  int expirationMonth;
  int securityCode;
  int userId;
  int personId;
  String createdAt;
  String updatedAt;

  Donor({
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.pathImage,
    this.cardHolder,
    this.cardNumber,
    this.expirationYear,
    this.expirationMonth,
    this.securityCode,
    this.userId,
    this.personId,
    this.createdAt,
    this.updatedAt,
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
}
