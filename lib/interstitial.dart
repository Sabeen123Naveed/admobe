import 'package:admobe/admobe.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class Screeninterstitial extends StatefulWidget {
  const Screeninterstitial({Key? key}) : super(key: key);

  @override
  State<Screeninterstitial> createState() => _ScreeninterstitialState();
}

class _ScreeninterstitialState extends State<Screeninterstitial> {
  late InterstitialAd _interstitialAd;
  bool isInterAdLoaded = false;
  initInterstitialAd(){
    InterstitialAd.load(
        adUnitId: AdmobManager.inter_id,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(onAdLoaded:(InterstitialAd ad){
        setState(() {
          _interstitialAd = ad;
          isInterAdLoaded = true;
        });
          _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad){
              _interstitialAd.dispose();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              _interstitialAd.dispose();
            }
            );



        },
            onAdFailedToLoad: (error){

            }
            ),
    );

  }
      void initState(){
       super.initState();
       initInterstitialAd();
       }

      @override
       Widget build(BuildContext context) {
      return WillPopScope(
        onWillPop: () {
          if (isInterAdLoaded) {
            _interstitialAd.show();
          }
          Navigator.pop(context);
          return null!;
        },

        child: Scaffold(
       appBar: AppBar(
        title: Text("Interstitial Ads"),
         leading: InkWell(
        onTap: (){
        if (isInterAdLoaded) {
        _interstitialAd.show();
         }
        Navigator.pop(context);
         },
        child: Icon(Icons.arrow_back),
        ),
         ),
       )
      );
  }
}
