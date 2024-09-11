import 'package:flutter/material.dart';
import 'package:jobportal/dashboard/dashboard_page.dart';
import 'package:jobportal/signin/signin_home.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>{

  double? scrWidth, scrHeight;
  String userid='';

  @override
  void initState() {
    // TODO: implement initState
    getPref();
    super.initState();

  }

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     var uid = prefs.getString('userId');

     if(uid!=null) {
       setState(() {
         userid=uid;
       });

       print("userid $userid");
     }
     print("uid $uid");
  }


  @override
  Widget build(BuildContext context) {
    scrWidth = MediaQuery
        .of(context)
        .size
        .width;
    scrHeight = MediaQuery
        .of(context)
        .size
        .height;

    return userid==null || userid ==''?
    SignInHomePage():DashboardPage();

  }
}