
import 'package:carweb/core/Resposive.dart';
import 'package:carweb/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class colorContiner extends StatelessWidget {
  const colorContiner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width/ 4.4,
      color: colorcontainer,
      child: Column(
        children: [
          SizedBox(height: 20*AppSizeConfig.heightMultiplier!,),
          Center(
            child:
          Image.asset("assets/img_2.png", height: 10*AppSizeConfig.heightMultiplier!, width:20*AppSizeConfig.widthMultiplier!)),
          SizedBox(height: 3*AppSizeConfig.heightMultiplier!,),
          Text("Admin Login",style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 2.5*AppSizeConfig.heightMultiplier!, color: Colors.white),),
        ],
      ),
    );
  }
}
