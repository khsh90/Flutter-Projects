import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/pages/signin.dart';
import 'package:login/pages/signup.dart';

class WelcomeWidget extends StatelessWidget {
  Widget cutomElevatedButton(
      {required Color btnColor,
      required String btnName,
      required void Function() btnFunction}) {
    return ElevatedButton(
      onPressed: btnFunction,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(300, 45),
        primary: btnColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        elevation: 3,
      ),
      child: Text(btnName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          // color: Colors.red,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                child: Image.asset(
                  'assets/images/main_top.png',
                  width: 95,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Image.asset(
                  'assets/images/main_bottom.png',
                  width: 75,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Welcome to my world',
                      style: TextStyle(
                          fontFamily: 'Courgette',
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SvgPicture.asset(
                      'assets/icons/chat.svg',
                      width: MediaQuery.of(context).size.width - 90,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    cutomElevatedButton(
                        btnColor: Color.fromARGB(255, 99, 22, 112),
                        btnName: 'Login',
                        btnFunction: () {
                          Navigator.of(context).pushNamed(SigninPage.route);
                        }),
                    const SizedBox(
                      height: 18,
                    ),
                    cutomElevatedButton(
                        btnColor: Color.fromARGB(255, 203, 141, 214),
                        btnName: 'Sign UP',
                        btnFunction: () {
                          Navigator.of(context).pushNamed(SignUPPage.route);
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
