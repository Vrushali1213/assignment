import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobportal/routes/app_pages.dart';
import 'package:jobportal/routes/app_routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyBKHL--1uIMiDUTddxdxeW-bgKgACqO8oo',
        appId: '1:984809655006:android:08aad591b22f9729f5904f',
        messagingSenderId: '984809655006',
        projectId: 'jobportal-8f97c',
        storageBucket: 'jobportal-8f97c.appspot.com',
      )
  );

  runApp( MyApp());
}


class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      initialRoute:  AppRoutes.FIRSTPAGE,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      title: 'Sign In',
    );
  }
}
