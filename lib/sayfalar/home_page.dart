import 'package:flutter/material.dart';
import 'package:flutterprojecy/sayfalar/profil.dart';
import 'package:flutterprojecy/sayfalar/shopping_card.dart';
import 'package:flutterprojecy/sayfalar/product_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'announcements.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int currentTab = 0;
  final List<Widget> screens = [
    UrunSayfasi(),
    Sepetim(),
    Duyurular(),
    Profil(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = UrunSayfasi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent[400],
        child: Icon(
          FontAwesomeIcons.shoppingCart,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            currentScreen = Sepetim();
            currentTab = 0;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = UrunSayfasi();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.home,
                            color: Colors.blue[800],
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = Sepetim();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.search,
                            color: Colors.lightGreen[400],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Right
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = Duyurular();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.envelopeOpen,
                            color: Colors.lightGreen[400],
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Profil();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.user,
                            color: Colors.lightGreen[400],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
