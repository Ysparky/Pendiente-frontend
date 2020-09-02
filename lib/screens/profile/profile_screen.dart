import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 81.0,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://img-a.udemycdn.com/user/200_H/11767934_4361_2.jpg'),
                radius: 80.0,
              ),
            ),
          ),
          Text('Fernando Herrera', style: TextStyle(fontSize: 24.0)),
          const SizedBox(height: 5.0),
          Text('fernanduchis@gmail.com',
              style: TextStyle(color: Colors.black54)),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.25, vertical: size.height * 0.025),
            child: Column(
              children: [
                _indicatorsRow('Colaboraciones', 121),
                const SizedBox(height: 15.0),
                _indicatorsRow('Seguidores', 20),
              ],
            ),
          ),
          // DonationCard(size: null, donationModel: null)
        ],
      ),
    );
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
