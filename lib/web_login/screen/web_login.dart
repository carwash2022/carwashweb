
import 'package:carweb/core/Resposive.dart';
import 'package:carweb/core/colors.dart';
import 'package:carweb/web_login/screen/widgets/colorcontinert.dart';
import 'package:carweb/web_login/screen/widgets/logincontiner.dart';
import 'package:flutter/material.dart';


class Web_login extends StatefulWidget {
  const Web_login({Key? key}) : super(key: key);

  @override
  _Web_loginState createState() => _Web_loginState();
}

class _Web_loginState extends State<Web_login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          colorContiner(),

          Row(
            children: [
              SizedBox(width: 40*AppSizeConfig.widthMultiplier!,),
              Login_field(

              ),
            ],
          )


        ],
      ),
    );
  }
}
