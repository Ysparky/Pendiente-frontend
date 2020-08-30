import 'package:flutter/material.dart';
import 'package:pendiente_frontend_flutter/model/campaign_model.dart';
import 'package:pendiente_frontend_flutter/screens/campaign_detail/campaign_detail_screen.dart';
import 'package:pendiente_frontend_flutter/screens/campaigns/components/footer_card.dart';
import 'package:pendiente_frontend_flutter/screens/campaigns/components/header_card.dart';
import 'package:pendiente_frontend_flutter/screens/campaigns/components/image_card.dart';

class CampaignCard extends StatelessWidget {
  final Campaign campaignModel;

  const CampaignCard({Key key, @required this.campaignModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          CampaignDetailScreen.routeName,
          arguments: campaignModel,
        );
      },
      child: Container(
        height: size.height * 0.5,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.03,
          vertical: size.height * 0.015,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2.0,
              spreadRadius: 2.0,
            )
          ],
        ),
        child: Column(
          children: [
            HeaderCard(campaignModel: campaignModel),
            ImageCard(campaignModel: campaignModel),
            FooterCard(campaignModel: campaignModel),
          ],
        ),
      ),
    );
  }
}
