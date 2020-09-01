import 'package:flutter/material.dart';
import 'package:pendiente_frontend_flutter/model/baskets_model.dart';
import 'package:pendiente_frontend_flutter/model/campaign_model.dart';
import 'package:pendiente_frontend_flutter/provider/campaign_list_provider.dart';
import 'package:pendiente_frontend_flutter/shared-preferences/shared_preferences.dart';

class HorizontalPricesList extends StatefulWidget {
  HorizontalPricesList({
    Key key,
    @required this.size,
    @required this.campaignModel,
  }) : super(key: key);

  final Size size;
  final Campaign campaignModel;

  @override
  _HorizontalPricesListState createState() => _HorizontalPricesListState();
}

class _HorizontalPricesListState extends State<HorizontalPricesList> {
  final detailCampaignProvider = new CampaignListProvider();
  final prefs = new SharedPref();
  Basket _current = Basket();

  void _onPriceSelect(Basket basket) {
    setState(() {
      _current = basket;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        flex: 1,
        child: FutureBuilder(
            future: detailCampaignProvider
                .getCampaignsDetail(widget.campaignModel.id),
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
      padding: EdgeInsets.symmetric(horizontal: widget.size.width * 0.02),
      itemBuilder: (context, index) => _CampaignPricesButton(
        basketModel: campaign.baskets[index],
        selected: _current.id == campaign.baskets[index].id,
        onTap: () {
          _onPriceSelect(campaign.baskets[index]);
          prefs.basketId = _current.id;
        },
      ),
    );
  }
}

class _CampaignPricesButton extends StatelessWidget {
  const _CampaignPricesButton({
    Key key,
    this.basketModel,
    this.onTap,
    this.selected = false,
  }) : super(key: key);
  final Basket basketModel;
  final VoidCallback onTap;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(35.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: selected ? Colors.lime[200] : Colors.transparent,
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: FlutterLogo(),
            ),
            SizedBox(height: 5.0),
            Text(
              'S/.${basketModel.price}',
            )
          ],
        ),
      ),
    );
  }
}
