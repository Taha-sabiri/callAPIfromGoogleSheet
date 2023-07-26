import 'package:banaabnie/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then((value) => {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Home()))
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(186, 0, 0, 1),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "میلگــرد بســتر",
            style: TextStyle(
                color: Colors.white, fontFamily: 'Kenar', fontSize: 40),
          ),
          const SizedBox(
            height: 5,
          ),
          const SpinKitThreeBounce(
            color: Colors.white,
            size: 20.0,
          )
        ]),
      ),
    );
  }
}
