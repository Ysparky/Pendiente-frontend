import 'package:flutter/material.dart';
import 'package:pendiente_frontend_flutter/model/donation_model.dart';

class DonationCard extends StatelessWidget {
  const DonationCard({
    Key key,
    @required this.size,
    @required this.donationModel,
  }) : super(key: key);

  final Size size;
  final Donation donationModel;
  @override
  Widget build(BuildContext context) {
    final double cardSize = (size.height - kToolbarHeight) * 0.4;
    return Container(
      height: cardSize,
      width: size.width,
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.03, vertical: size.height * 0.01),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2.0,
            blurRadius: 5.0,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Text(
              donationModel.campaignName.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: cardSize * 0.55,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/images/loading.gif'),
                image: NetworkImage(donationModel.campaignImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _detailRow('Monto', 'S/. ${donationModel.donationAmount}'),
                  _detailRow('Fecha', donationModel.donationCreatedDate),
                  Row(
                    children: [
                      _detailRow('ONG', donationModel.ongName),
                      Spacer(),
                      Text(
                          '${donationModel.currentDonationStatusId}/5: ${donationModel.currentDonationStatusName}'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _detailRow(String text, String value) {
    return Row(
      children: [
        Text(
          '$text: ',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Text('$value')
      ],
    );
  }
}
