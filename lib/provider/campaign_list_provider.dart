import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:pendiente_frontend_flutter/model/campaign_model.dart';
import 'package:pendiente_frontend_flutter/model/donor_model.dart';

class CampaignListProvider {
  Future<List<Campaign>> makeRequest(int userId) async {
    final response = await http.get(
        'https://pendiente-backend.herokuapp.com/api/campaigns/donor/$userId');

    final decodedData = json.decode(response.body);

    final campaigns = new Campaigns.fromJsonList(decodedData['data']);
    return campaigns.campaignsList;
  }

  Future<Campaign> getCampaignsDetail(int campaignId) async {
    final response = await http.get(
        'https://pendiente-backend.herokuapp.com/api/campaigns/$campaignId');

    final decodedData = json.decode(response.body);
    Campaign campaign = new Campaign.fromCampaignDetailMap(decodedData['data']);
    return campaign;
  }

  Future<Donor> postLogin(String email, String password) async {
    final response = await http.post(
        'https://pendiente-backend.herokuapp.com/api/authenticate/login',
        body: {
          "email": email,
          "password": password,
        });
    if (response.statusCode != 200) return null;
    final decodedData = json.decode(response.body);
    Donor donor = new Donor.loginInfo(decodedData['data']);
    return donor;
  }

  Future<Donor> postRegister(Donor donor) async {
    final response = await http
        .post('https://pendiente-backend.herokuapp.com/api/users', body: {
      "name": donor.name,
      "lastName": donor.lastName,
      "email": donor.email,
      "password": donor.password,
    });
    if (response.statusCode != 200) return null;
    final decodedData = json.decode(response.body);
    Donor createdDonor = new Donor.loginInfo(decodedData['data']);
    print(createdDonor.id);
    print(createdDonor.name);
    return createdDonor;
  }

  Future<bool> postMakeDonation() async {
    print('MAKING REQUEST');
    // final response = await http.post(
    //     'https://pendiente-backend.herokuapp.com/api/donations/',
    //     body: <String, dynamic>{
    //       "email": "leo@urp.com",
    //       "card_number": "4111111111111111",
    //       "cvv": "123",
    //       "expiration_year": "2025",
    //       "expiration_month": "09",
    //       "first_name": "Leo",
    //       "last_name": "Espinoza",
    //       "description":
    //           "Donación de ${campaignModel.baskets[0].price} soles a ${campaignModel.description} ",
    //       "donorId": 2,
    //       "basketId": campaignModel.baskets[0].id,
    //     });

    final response = await http.post(
        'https://pendiente-backend.herokuapp.com/api/donations/',
        body: <String, dynamic>{
          "email": "leo@urp.com",
          "card_number": "4111111111111111",
          "cvv": "123",
          "expiration_year": "2025",
          "expiration_month": "09",
          "first_name": "Leo",
          "last_name": "Espinoza",
          "description": "Metro: bolsa de donación del banco de alimentos",
          "donorId": "2",
          "basketId": "14",
        });
    return response.statusCode == 200 ? true : false;
  }
}
