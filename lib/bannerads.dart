import 'package:admobe/admobe.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class MyBanner extends StatefulWidget {
  const MyBanner({Key? key}) : super(key: key);

  @override
  State<MyBanner> createState() => _MyBannerState();
}

class _MyBannerState extends State<MyBanner> {
  late BannerAd _bannerAd;
  bool isBannerAdLoaded = false;
  initBannerAd() {
    _bannerAd = BannerAd(size: AdSize.banner,
      adUnitId: AdmobManager.banner_id,
      request: AdRequest(),
      listener: BannerAdListener(onAdLoaded: (Ad ad) {
        setState(() {
          isBannerAdLoaded = true;
        });
      },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            ad.dispose();
            print("HelloAds Ad failed to load : $error");
          },
          onAdOpened: (Ad ad) {
            return print("HelloAds Ad opened");
          }
      ),
    );
    _bannerAd.load();
  }
    @override
    void initState()  {
      super.initState();

      initBannerAd();
    }

  @override
  void disposeState(){
    super.dispose();
    _bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(title: Text("Banner Ads"),
        )
        ,
        bottomNavigationBar: isBannerAdLoaded ?
        Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          width: _bannerAd.size.width.toDouble(),
          height: _bannerAd.size.height.toDouble(),
          child: AdWidget(ad: _bannerAd ),


        ):SizedBox(),
        body: Container(),

      ),
    );
  }
}

