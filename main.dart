import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const ReimiePayApp());
}

class ReimiePayApp extends StatefulWidget {
  const ReimiePayApp({super.key});
  @override
  State<ReimiePayApp> createState() => _ReimiePayAppState();
}

class _ReimiePayAppState extends State<ReimiePayApp> {
  BannerAd? _bannerAd;
  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-7817232546318110/3023230023',
      size: AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    )..load();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(title: const Text('ReimiePay - Data Deals')),
        body: const Center(
          child: Text('Compare Data Prices\nMTN, Glo, Airtel, 9mobile',
            style: TextStyle(color: Colors.white, fontSize: 22),
            textAlign: TextAlign.center),
        ),
        bottomNavigationBar: _bannerAd == null ? null :
          SizedBox(
            height: _bannerAd!.size.height.toDouble(),
            width: _bannerAd!.size.width.toDouble(),
            child: AdWidget(ad: _bannerAd!),
          ),
      ),
    );
  }
}
