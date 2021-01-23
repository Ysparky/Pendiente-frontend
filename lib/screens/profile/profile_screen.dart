import 'package:flutter/material.dart';

import 'package:pendiente_frontend_flutter/model/donor_model.dart';

import 'package:pendiente_frontend_flutter/screens/favorite_campaigns/donation_card.dart';
import 'package:pendiente_frontend_flutter/service/api_service.dart';

class ProfileScreen extends StatelessWidget {
  final donorProvider = new ApiService();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: donorProvider.getDonorProfile(),
        builder: (_, AsyncSnapshot<Donor> snapshot) {
          return snapshot.hasData
              ? Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 76.0,
                          child: CircleAvatar(
                            backgroundImage: snapshot.data.pathImage == null
                                ? AssetImage(
                                    'assets/images/profile-placeholder.png')
                                : NetworkImage(snapshot.data.pathImage),
                            radius: 75.0,
                          ),
                        ),
                      ),
                      Text('${snapshot.data.name} ${snapshot.data.lastName}',
                          style: TextStyle(fontSize: 24.0)),
                      const SizedBox(height: 5.0),
                      Text(snapshot.data.email,
                          style: TextStyle(color: Colors.black54)),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.25,
                            vertical: size.height * 0.025),
                        child: Column(
                          children: [
                            _indicatorsRow('Colaboraciones',
                                snapshot.data.colaborationsQty),
                            const SizedBox(height: 15.0),
                            _indicatorsRow(
                                'Seguidores', snapshot.data.followersQty),
                          ],
                        ),
                      ),
                      Spacer(),
                      DonationCard(
                          size: size,
                          donationModel: snapshot.data.lastDonation),
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator());
        });
  }

  Row _indicatorsRow(String text, int number) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontWeight: FontWeight.w600)),
        Spacer(),
        Text('$number'),
      ],
    );
  }
}
