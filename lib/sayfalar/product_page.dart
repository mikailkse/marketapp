import 'package:flutter/material.dart';
import 'package:flutterprojecy/sayfalar/shopping_card.dart';
import 'package:flutterprojecy/sayfalar/products.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UrunSayfasi extends StatefulWidget {
  @override
  _UrunSayfasiState createState() => _UrunSayfasiState();
}

class _UrunSayfasiState extends State<UrunSayfasi> {
  int _aktifIcerikNo = 0;
  List<Widget>? _icerikler;

  @override
  void initState() {
    super.initState();

    _icerikler = [Urunler(), Sepetim()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red[400]),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Uçarak Gelsin",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: Icon(
              FontAwesomeIcons.solidHeart,
              color: Colors.lightGreen[400],
            ),
          ),
        ],
      ),
      body: _icerikler![_aktifIcerikNo],
    );
  }
}
