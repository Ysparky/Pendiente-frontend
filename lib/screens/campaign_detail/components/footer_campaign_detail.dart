import 'package:flutter/material.dart';
import 'package:pendiente_frontend_flutter/screens/card_info/register_card_screen.dart';
import 'package:pendiente_frontend_flutter/screens/components/sign_button.dart';

class FooterCampaignDetail extends StatelessWidget {
  const FooterCampaignDetail({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.025,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.credit_card, size: 40.0),
              const SizedBox(width: 5.0),
              Text('1234', style: TextStyle(fontSize: 16.0)),
              Spacer(),
              FlatButton(
                textColor: Colors.blue,
                child: Text('Cambiar', style: TextStyle(fontSize: 16.0)),
                onPressed: () {
                  Navigator.pushNamed(context, RegisterCardScreeen.routeName);
                },
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
            child: SignButton(size: size, text: 'DONAR', onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
