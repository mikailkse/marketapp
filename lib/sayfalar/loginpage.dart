import 'package:flutter/material.dart';
import 'package:flutterprojecy/sayfalar/home_page.dart';
import 'package:flutterprojecy/sayfalar/registerpage.dart';
import 'package:flutterprojecy/servis/auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.1, backgroundColor: Colors.white.withOpacity(0.9)),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              right: 10,
              left: 10,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hoşgeldin !",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      ),
                    ),
                    Text(
                      "Giriş Yap",
                      style: TextStyle(
                          color: Colors.teal[600],
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Devam etmek için oturum açın",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email adresini girin",
                    prefixIcon: Icon(Icons.mail),
                  ),
                  validator: (girilenDeger) {
                    if (girilenDeger!.isEmpty) {
                      return "Email alanı boş bırakılamaz!";
                    } else if (!girilenDeger.contains("@")) {}
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: "Şifrenizi girin",
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (girilenDeger) {
                    if (girilenDeger!.isEmpty) {
                      return "Şifre alanı boş bırakılamaz!";
                    } else if (girilenDeger.trim().length < 4) {
                      return "Şifre 4 karakterden az olamaz !";
                    }
                  },
                ),
                SizedBox(height: 20),
                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Şifreni mi unuttun ?",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: girisYap,
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(15)),
                  child: Row(
                    children: [
                      SizedBox(width: 150),
                      Text(
                        "Giriş Yap",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Text("-VEYA-"),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(15)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.black,
                        size: 28,
                      ),
                      SizedBox(width: 100),
                      Text(
                        "Hesap Oluştur",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogin();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(15)),
                  child: Row(
                    children: [
                      Image.asset('assets/images/google.png'),
                      SizedBox(width: 100),
                      Text(
                        "Google İle Giriş Yap",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void girisYap() {
    _authService
        .signIn(_emailController.text, _passwordController.text)
        .then((value) {
      return Navigator.push(
          context, MaterialPageRoute(builder: (context) => Anasayfa()));
    });
  }
}
