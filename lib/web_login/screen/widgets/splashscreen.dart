import 'package:carweb/dashboard/screen/dashboard.dart';
import 'package:carweb/web_login/screen/web_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    getperrence();
    super.initState();
  }

  getperrence() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = await prefs.getString('id');
    Future.delayed(Duration(seconds: 2),(){
      if(id == null){
        Get.to(Web_login());

      }else {
        Get.to(Dashboard());
      }

    }
    );
  }





  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



