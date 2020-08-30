import 'package:flutter/material.dart';
import 'package:pendiente_frontend_flutter/model/campaign_model.dart';
import 'package:pendiente_frontend_flutter/provider/campaign_list_provider.dart';
import 'package:pendiente_frontend_flutter/screens/campaign_detail/components/campaign_prices_button.dart';

class HorizontalPricesList extends StatelessWidget {
  HorizontalPricesList({
    Key key,
    @required this.size,
    @required this.campaignModel,
  }) : super(key: key);

  final Size size;
  final Campaign campaignModel;
  final detailCampaignProvider = new CampaignListProvider();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        flex: 1,
        child: FutureBuilder(
            future: detailCampaignProvider.getCampaignsDetail(campaignModel.id),
            builder: (context, AsyncSnapshot<Campaign> snapshot) {
              return snapshot.hasData
                  ? _priceButton(snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  ListView _priceButton(Campaign campaign) {
    return ListView.builder(
      itemCount: campaign.baskets.length,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      itemBuilder: (context, index) =>
          CampaignPricesButton(basketModel: campaign.baskets[index]),
    );
  }
}
