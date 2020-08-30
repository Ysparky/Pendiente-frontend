import 'package:flutter/material.dart';
import 'package:pendiente_frontend_flutter/model/campaign_model.dart';
import 'package:pendiente_frontend_flutter/screens/campaigns/components/social_interaction_button.dart';

class FooterCard extends StatelessWidget {
  const FooterCard({
    Key key,
    @required this.campaignModel,
  }) : super(key: key);

  final Campaign campaignModel;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Expanded(
      flex: 5,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.025,
          vertical: size.height * 0.02,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      campaignModel.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(height: 1.2, fontSize: 15.0),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: campaignModel.favoriteStatus
                          ? Icon(Icons.star, color: Colors.yellow)
                          : Icon(Icons.star_border),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2.0),
            Expanded(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle, color: Colors.blue),
                  const SizedBox(width: 5.0),
                  Text(
                    campaignModel.likesQuantity.toString(),
                    style: TextStyle(fontSize: 12.0),
                  ),
                  Spacer(),
                  Text(
                    campaignModel.commentsQuantity != 1
                        ? '${campaignModel.commentsQuantity} comentarios'
                        : '${campaignModel.commentsQuantity} comentario',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    campaignModel.donations != 1
                        ? '${campaignModel.donations} donaciones'
                        : '${campaignModel.donations} donación',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.black, thickness: 0.5),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialInteractionButton(
                    interactionIcon: Icons.thumb_up,
                    interactionText: 'Me gusta',
                    interactionColor:
                        campaignModel.likeStatus ? Colors.blue : Colors.black,
                    onTap: () {},
                  ),
                  SocialInteractionButton(
                    interactionIcon: Icons.mode_comment,
                    interactionText: 'Comentar',
                    onTap: () {},
                  ),
                  SocialInteractionButton(
                    interactionIcon: Icons.screen_share,
                    interactionText: 'Compartir',
                    onTap: () {},
                  ),
                  _donateButton(size),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _donateButton(Size size) {
    return Expanded(
      child: Container(
        height: size.height * 0.04,
        margin: EdgeInsets.symmetric(horizontal: 3.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.card_giftcard, size: 16.0),
            SizedBox(width: size.width * 0.006),
            Text('Donar', style: TextStyle(fontSize: 12.0)),
          ],
        ),
      ),
    );
  }
}
