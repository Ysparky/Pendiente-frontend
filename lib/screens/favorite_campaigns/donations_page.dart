import 'package:flutter/material.dart';

import 'package:pendiente_frontend_flutter/provider/api_provider.dart';

import 'package:pendiente_frontend_flutter/screens/favorite_campaigns/donation_card.dart';

class DonationsScreen extends StatelessWidget {
  final donationsProvider = new ApiProvider();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: donationsProvider.getDonationsById(),
      builder: (_, AsyncSnapshot<List> snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                itemCount: snapshot.data.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (_, index) => DonationCard(
                  size: size,
                  donationModel: snapshot.data[index],
                ),
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
