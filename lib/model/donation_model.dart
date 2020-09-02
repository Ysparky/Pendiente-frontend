class Donations {
  List<Donation> donationsList = new List();

  Donations.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((d) {
      final donation = new Donation.fromJsonMap(d);
      donationsList.add(donation);
    });
  }
}

class Donation {
  int donationId;
  String donationAmount;
  bool donationIsDefault;
  int donationQuantity;
  String donationBasketPrice;
  String campaignName;
  String campaignImage;
  String ongName;
  String ongImage;
  int currentDonationStatusId;
  String currentDonationStatusName;
  String donationCreatedDate;

  Donation({
    this.donationId,
    this.donationAmount,
    this.donationIsDefault,
    this.donationQuantity,
    this.donationBasketPrice,
    this.campaignName,
    this.campaignImage,
    this.ongName,
    this.ongImage,
    this.currentDonationStatusId,
    this.currentDonationStatusName,
    this.donationCreatedDate,
  });

  factory Donation.fromJsonMap(Map<String, dynamic> json) => Donation(
        donationId: json['donationId'],
        donationAmount: json['donationAmount'],
        donationIsDefault: json['donationIsDefault'],
        donationQuantity: json['donationQuantity'],
        donationBasketPrice: json['donationBasketPrice'],
        campaignName: json['campaignName'],
        campaignImage: json['campaignImage'],
        ongName: json['ongName'],
        ongImage: json['ongImage'],
        currentDonationStatusId: json['currentDonationStatusId'],
        currentDonationStatusName: json['currentDonationStatusName'],
        donationCreatedDate: json['donationCreatedDate'],
      );

  factory Donation.fromProfileMap(Map<String, dynamic> json) => Donation(
        campaignName: json['campaignName'],
        // campaignDescription: json['campaignDescription'],
        campaignImage: json['campaignImage'],
        ongName: json['ongName'],
        ongImage: json['ongImage'],
        donationCreatedDate: json['createdAt'],
      );
}
