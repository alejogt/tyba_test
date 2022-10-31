import 'package:flutter/material.dart';

class TybaHomePage extends StatefulWidget {
  static const routeName = '/home';
  final String title;

  TybaHomePage({Key? key, required this.title}) : super(key: key);
  @override
  _TybaHomePageState createState() => _TybaHomePageState();
}

class _TybaHomePageState extends State<TybaHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: SafeArea(
            top: false,
            minimum: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Image.asset(
                    "assets/images/tyba.png",
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    "Tyba Frontend Engineer test",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/universities');
                      },
                      child: Text(
                        "Go!!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(248, 122, 37, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))
                ])));
  }
}
