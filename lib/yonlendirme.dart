import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterprojecy/sayfalar/home_page.dart';
import 'package:flutterprojecy/sayfalar/loginpage.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return Anasayfa();
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata'));
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
