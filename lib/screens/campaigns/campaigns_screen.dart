import 'package:flutter/material.dart';
import 'package:pendiente_frontend_flutter/screens/campaigns/campaign_card.dart';
import 'package:pendiente_frontend_flutter/service/api_service.dart';

class CampaignsScreen extends StatelessWidget {
  final campaignListProvider = new ApiService();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: campaignListProvider.getCampaignsByDonorId(),
      builder: (context, snapshot) => _campaignsList(context, snapshot, size),
    );
  }

  _campaignsList(
      BuildContext context, AsyncSnapshot<List> snapshot, Size size) {
    return snapshot.hasData
        ? ListView.builder(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => CampaignCard(
              campaignModel: snapshot.data[index],
            ),
            itemCount: snapshot.data.length,
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
