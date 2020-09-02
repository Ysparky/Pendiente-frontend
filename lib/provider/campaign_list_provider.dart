import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:pendiente_frontend_flutter/model/campaign_model.dart';
import 'package:pendiente_frontend_flutter/model/donation_model.dart';
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

  Future<bool> postMakeDonation(
      Campaign campaign, int basketId, int donorId) async {
    print("Donación a ${campaign.name} - (${campaign.ongName})");
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
          "description": "Donación a ${campaign.name} - (${campaign.ongName})",
          "donorId": donorId.toString(),
          "basketId": basketId.toString(),
        });
    return response.statusCode == 200 ? true : false;
  }

  Future<List<Donation>> getDonationsById(int donorId) async {
    final response = await http.get(
        'https://pendiente-backend.herokuapp.com/api/donations/donor/$donorId');

    final decodedData = json.decode(response.body);
    Donations donations = new Donations.fromJsonList(decodedData['data']);
    donations.donationsList.sort((a, b) =>
        a.currentDonationStatusId.compareTo(b.currentDonationStatusId));
    return donations.donationsList;
  }

  Future<bool> putLike(int campaignId, int donorId) async {
    final response = await http.put(
        'https://pendiente-backend.herokuapp.com/api/likes/',
        body: <String, String>{
          "donorId": "$donorId",
          "campaignId": "$campaignId",
        });

    return response.statusCode == 200 ? true : false;
  }
}
