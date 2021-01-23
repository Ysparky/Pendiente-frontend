import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:pendiente_frontend_flutter/model/models.dart';
import 'package:pendiente_frontend_flutter/shared-preferences/shared_preferences.dart';

// const BASE_URL = 'https://pendiente-backend.herokuapp.com/api';
const BASE_URL = 'http://192.168.0.109:5001/api';

class ApiService {
  final _prefs = new SharedPref();

  Future<List<Campaign>> getCampaignsByDonorId() async {
    final response =
        await http.get('$BASE_URL/campaigns/donor/${_prefs.donorId}');
    final decodedBody = json.decode(response.body);
    Campaigns campaigns = new Campaigns.fromJsonList(decodedBody['data']);
    return campaigns.campaignsList;
  }

  Future<Campaign> getCampaignsDetail(int campaignId) async {
    final response = await http.get('$BASE_URL/campaigns/$campaignId');
    final decodedBody = json.decode(response.body);
    Campaign campaign = new Campaign.fromCampaignDetailMap(decodedBody['data']);
    return campaign;
  }

  Future<Donor> postLogin(String email, String password) async {
    final response = await http.post('$BASE_URL/authenticate/login', body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode != 200) return null;
    final decodedBody = json.decode(response.body);
    Donor donor = new Donor.loginInfo(decodedBody['data']);
    return donor;
  }

  Future<Donor> postRegister(Donor donor) async {
    final response = await http.post('$BASE_URL/users', body: {
      "name": donor.name,
      "lastName": donor.lastName,
      "email": donor.email,
      "password": donor.password,
    });
    if (response.statusCode != 200) return null;
    final decodedBody = json.decode(response.body);
    Donor createdDonor = new Donor.loginInfo(decodedBody['data']);
    return createdDonor;
  }

  Future<bool> postMakeDonation(Campaign campaign) async {
    final response = await http.post('$BASE_URL/donations/', body: {
      "email": "leo@urp.com",
      "card_number": "4111111111111111",
      "cvv": "123",
      "expiration_year": "2025",
      "expiration_month": "09",
      "first_name": "Leo",
      "last_name": "Espinoza",
      "description": "Donación a ${campaign.name} - (${campaign.ongName})",
      "donorId": "${_prefs.donorId}",
      "basketId": "${_prefs.basketId}",
    });
    return response.statusCode == 200 ? true : false;
  }

  Future<List<Donation>> getDonationsById() async {
    final response =
        await http.get('$BASE_URL/donations/donor/${_prefs.donorId}');
    final decodedBody = json.decode(response.body);
    Donations donations = new Donations.fromJsonList(decodedBody['data']);
    donations.donationsList.sort((a, b) =>
        a.currentDonationStatusId.compareTo(b.currentDonationStatusId));
    return donations.donationsList;
  }

  Future<bool> putLike(int campaignId) async {
    final response = await http.put('$BASE_URL/likes/', body: {
      "donorId": "${_prefs.donorId}",
      "campaignId": "$campaignId",
    });
    return response.statusCode == 200 ? true : false;
  }

  Future<Donor> getDonorProfile() async {
    final response = await http.get('$BASE_URL/users/${_prefs.donorId}');
    final decodedBody = json.decode(response.body);
    final donor = new Donor.fromProfileJsonMap(decodedBody['data']);
    if (donor.pathImage != null) _prefs.donorImage = donor.pathImage;
    _prefs.donorName = '${donor.name} ${donor.lastName}';
    _prefs.donorEmail = donor.email;
    return donor;
  }
}
