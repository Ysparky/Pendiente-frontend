import 'package:flutter/material.dart';
import 'package:pendiente_frontend_flutter/model/campaign_model.dart';
import 'package:pendiente_frontend_flutter/provider/campaign_list_provider.dart';
import 'package:pendiente_frontend_flutter/screens/components/sign_button.dart';
import 'package:pendiente_frontend_flutter/shared-preferences/shared_preferences.dart';
import 'package:progress_dialog/progress_dialog.dart';

class FooterCampaignDetail extends StatelessWidget {
  final prefs = new SharedPref();
  FooterCampaignDetail({
    Key key,
    @required this.size,
    this.campaignModel,
  }) : super(key: key);

  final Size size;
  final Campaign campaignModel;
  final donationProvider = new CampaignListProvider();
  @override
  Widget build(BuildContext context) {
    ProgressDialog progressDialog =
        ProgressDialog(context, isDismissible: false);
    progressDialog.style(
      message: 'Realizando transacción',
      progressWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(),
      ),
    );
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
              Text('1111', style: TextStyle(fontSize: 16.0)),
              Spacer(),
              FlatButton(
                textColor: Colors.blue,
                child: Text('Cambiar', style: TextStyle(fontSize: 16.0)),
                onPressed: null,
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
            child: SignButton(
                size: size,
                text: 'DONAR',
                onPressed: () async {
                  int basketId = prefs.basketId;
                  int donorId = prefs.donorId;
                  await progressDialog.show();
                  final response = await donationProvider.postMakeDonation(
                      campaignModel, basketId, donorId);
                  await progressDialog.hide();
                  if (response) {
                    prefs.remove('basketId');
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Transacción realizada correctamente')));
                  } else {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Ha ocurrido un error')));
                  }
                }),
          ),
        ],
      ),
    );
  }
}
