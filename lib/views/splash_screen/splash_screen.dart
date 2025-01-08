import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mnh/utils/app_images.dart';
import 'package:mnh/views/onBoarding_screens/onBoarding_view/onBoarding_view.dart';
import 'package:mnh/widgets/extensions/empty_space.dart';
import 'package:mnh/widgets/text_widget.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            70.asHeightBox,
            regularText(
                title: 'Come learn with us in your language',
                textSize: 16,
              textWeight: FontWeight.w700,
              textColor: Colors.black,
              alignText: TextAlign.center,
              textFamily: 'Poppins'
            ),
            40.asHeightBox,
            Center(child: Image.asset(AppImages.AppLogo, scale: 8,)),
            140.asHeightBox,
            CircularProgressIndicator(),
            40.asHeightBox,
            Spacer(),
            regularText(
                title: 'Come learn with us in your language',
                textSize: 16,
                textWeight: FontWeight.w700,
                textColor: Colors.blueGrey,
                alignText: TextAlign.center,
                textFamily: 'Poppins'
            ),
            40.asHeightBox,
          ],
        ),
      ),
    );
  }
}
