import 'package:flutter/material.dart';
import 'package:graduation_project/Screens/UI_GetStarted/GetStarted.dart';

import 'package:splash_screen_view/SplashScreenView.dart';

import '../../themes.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(color: LightGrey),
                ),
              ));
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: SplashScreenView(
                text: "Shefaa",
                backgroundColor: LightGrey,
                duration: 2000,

                imageSrc: "assets/images/Shefaa-logos_transparent-rounded.png",
                imageSize: 220,
                navigateRoute: const GetStarted(),
                textStyle: const TextStyle(
                    color: Color(0xFF08295E),
                    fontSize: 40,
                    fontFamily: "Lobster",
                    fontWeight: FontWeight.w600,),
                textType: TextType.TyperAnimatedText,
              ),
            ),
          );
        }
      },
    );
  }
}
