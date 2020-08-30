import 'package:flutter/material.dart';
import 'package:pendiente_frontend_flutter/model/campaign_model.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key key,
    @required this.campaignModel,
  }) : super(key: key);

  final Campaign campaignModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Container(
        width: double.infinity,
        child: Image.network(
          campaignModel.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
