import 'package:flutter/material.dart';
import 'package:pendiente_frontend_flutter/model/campaign_model.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    Key key,
    @required this.campaignModel,
  }) : super(key: key);

  final Campaign campaignModel;

  @override
  Widget build(BuildContext context) {
    final donorsLength = campaignModel.donors.length;
    return Expanded(
      flex: 2,
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.black26,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ClipOval(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                          campaignModel.ongImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      campaignModel.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      campaignModel.ongName,
                      style: TextStyle(color: Colors.black87),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  donorsLength < 1
                      ? Container()
                      : _circleDonorImage(campaignModel.donors[0].pathImage),
                  const SizedBox(width: 5.0),
                  donorsLength < 2
                      ? Container()
                      : _circleDonorImage(campaignModel.donors[1].pathImage),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  CircleAvatar _circleDonorImage(String pathImage) {
    return CircleAvatar(
      backgroundImage: NetworkImage(pathImage),
      radius: 15.0,
    );
  }
}
