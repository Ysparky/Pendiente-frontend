import 'package:pendiente_frontend_flutter/model/models.dart';

class Campaigns {
  List<Campaign> campaignsList = new List();

  Campaigns.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((c) {
      final campaign = new Campaign.fromJsonMap(c);
      campaignsList.add(campaign);
    });
  }
}

class Campaign {
  int id;
  String name;
  String description;
  String image;
  int ongId;
  String ongName;
  String ongImage;
  int likesQuantity;
  int commentsQuantity;
  bool likeStatus;
  bool favoriteStatus;
  int donations;
  List<Donor> donors;
  List<Basket> baskets;

  Campaign({
    this.id,
    this.name,
    this.description,
    this.image,
    this.ongId,
    this.ongName,
    this.ongImage,
    this.likesQuantity,
    this.commentsQuantity,
    this.likeStatus,
    this.favoriteStatus,
    this.donations,
    this.donors,
    this.baskets,
  });

  factory Campaign.fromJsonMap(Map<dynamic, dynamic> json) => Campaign(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
        ongId: json['ongId'],
        ongName: json['ongName'],
        ongImage: json['ongImage'],
        likesQuantity: json['likesQuantity'],
        commentsQuantity: json['commentsQuantity'],
        likeStatus: json['likeStatus'],
        favoriteStatus: json['favoriteStatus'],
        donations: json['donations'],
        donors: new Donor().getDonorsList(json['donors']),
      );

  factory Campaign.fromCampaignDetailMap(Map<dynamic, dynamic> json) =>
      Campaign(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        description: json['description'],
        ongImage: json['ongImage'],
        ongName: json['ongName'],
        baskets: new Basket().getBasketsList(json['baskets']),
      );
}
