import 'package:flutter/material.dart';
import 'package:pendiente_frontend_flutter/model/baskets_model.dart';

class CampaignPricesButton extends StatelessWidget {
  const CampaignPricesButton({
    Key key,
    this.basketModel,
  }) : super(key: key);
  final Basket basketModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
    );
  }
}
