import 'package:flutter/material.dart';

import 'package:pendiente_frontend_flutter/model/campaign_model.dart';

import 'package:pendiente_frontend_flutter/screens/campaign_detail/components/footer_campaign_detail.dart';
import 'package:pendiente_frontend_flutter/screens/campaign_detail/components/horizontal_prices_list.dart';

class CampaignDetailScreen extends StatelessWidget {
  static String routeName = '/campaign_detail';
  @override
  Widget build(BuildContext context) {
    final Campaign campaignModel = ModalRoute.of(context).settings.arguments;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.35,
            width: double.infinity,
            child: FadeInImage(
              placeholder: AssetImage('assets/images/loading.gif'),
              image: NetworkImage(
                campaignModel.image,
              ),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: size.height * 0.08,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
            child: Image.network(
              campaignModel.ongImage,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            campaignModel.name.toUpperCase(),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.w900,
              color: Color(0xff666666),
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Text(
              campaignModel.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                height: 1.5,
                color: Color(0xff666666),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          HorizontalPricesList(size: size, campaignModel: campaignModel),
          const SizedBox(height: 8.0),
          Expanded(
            flex: 2,
            child:
                FooterCampaignDetail(size: size, campaignModel: campaignModel),
          )
        ],
      ),
    );
  }
}
