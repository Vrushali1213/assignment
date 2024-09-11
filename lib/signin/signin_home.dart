

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobportal/gen/appfont.dart';
import 'package:jobportal/gen/custom_color.dart';

import 'controller/auth_controller.dart';

class SignInHomePage extends StatelessWidget {
  SignInHomePage({super.key});

  double? scrWidth, scrHeight;

  @override
  Widget build(BuildContext context) {

    scrWidth = MediaQuery.of(context).size.width;
    scrHeight = MediaQuery.of(context).size.height;

    return Scaffold(

      appBar: AppBar(title: const Text('Google SignIn'),
        backgroundColor: CustomColor.blue,titleTextStyle: const TextStyle(
          fontFamily: AppFont.playfairDisplayBold,
          color: CustomColor.white,
          fontWeight: FontWeight.w700,
          letterSpacing: 1,
          fontSize: 15
      ),
        centerTitle: true,
    ),
      body:
      GetBuilder<AuthController>(
          init: AuthController(),
          builder: (AuthController con) {
            return
              Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 1.5,color: CustomColor.white)),
                      child: Image.asset(
                          "assets/images/googleicon.png",
                        fit:BoxFit.fill,
                        width: scrWidth!*0.18 ,),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        con.handleGoogleSignin();
                      },
                      child: Text("Sign in with Google"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    con.isLodingState == false
                        ? Container()
                        : Container(
                      alignment: Alignment.center,
                      height: 80,
                      width: 80,
                      child: CircularProgressIndicator(),
                    ),

                  ],
                ),
              );
          }),
    );
  }
}