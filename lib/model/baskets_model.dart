class Basket {
  int id;
  String name;
  String description;
  String pathImage;
  String price;
  int campaignId;
  String createdAt;
  String updatedAt;

  Basket({
    this.id,
    this.name,
    this.description,
    this.pathImage,
    this.price,
    this.campaignId,
    this.createdAt,
    this.updatedAt,
  });

  factory Basket.fromJsonMap(Map<String, dynamic> json) => Basket(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pathImage: json['pathImage'],
        price: json['price'],
        campaignId: json['campaignId'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  List<Basket> getBasketsList(List<dynamic> jsonList) {
    if (jsonList == null) return [];
    List<Basket> basketsList = new List();
    jsonList.forEach((b) {
      final basket = new Basket.fromJsonMap(b);
      basketsList.add(basket);
    });
    return basketsList;
  }
}
