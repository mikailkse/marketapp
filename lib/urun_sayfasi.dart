import 'package:flutter/material.dart';
import 'package:flutterprojecy/sepetim.dart';
import 'package:flutterprojecy/urunler.dart';

class UrunSayfasi extends StatefulWidget {
  @override
  _UrunSayfasiState createState() => _UrunSayfasiState();
}

class _UrunSayfasiState extends State<UrunSayfasi> {
  int _aktifIcerikNo = 0;
  late List<Widget> _icerikler;

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
      ),
      body: _icerikler[_aktifIcerikNo],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Selçuk Mert"),
              accountEmail: Text("selm123@mailim.com"),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2016/03/09/15/10/man-1246508_960_720.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              decoration: BoxDecoration(color: Colors.red[400]),
            ),
            ListTile(
              title: Text("Siparişlerim"),
              onTap: () {},
            ),
            ListTile(
              title: Text("İndirimlerim"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Ayarlar"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Çıkış Yap"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
