
import 'package:carweb/core/Resposive.dart';
import 'package:carweb/web_login/screen/widgets/fields.dart';
import 'package:flutter/material.dart';

class Login_field extends StatefulWidget {
  const Login_field({Key? key}) : super(key: key);

  @override
  _Login_fieldState createState() => _Login_fieldState();
}

class _Login_fieldState extends State<Login_field> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40*AppSizeConfig.heightMultiplier!,
      width: 60*AppSizeConfig.widthMultiplier!,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white
      ),
      child:  Fields(),
    );
  }
}
