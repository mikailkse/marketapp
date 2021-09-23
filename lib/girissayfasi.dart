import 'package:flutter/material.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({ Key? key }) : super(key: key);

  @override
  _GirisSayfasiState createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Selam"),
      ),
    );
  }
}