import 'package:admobe/bannerads.dart';
import 'package:admobe/interstitial.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:admobe/bannerads.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admobe"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder)
              {
                return MyBanner();
              }
              )
              );

          }, child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("Banner Ads", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black)),
          ),
            ),
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (builder)
                {
                  return Screeninterstitial();
                }
                )
                );

              }, child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Interstitial Ads", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black)),
            ),
            )
          ],
        ),
      ),
    );
  }
}
