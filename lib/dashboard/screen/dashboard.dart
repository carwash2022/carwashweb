
import 'package:carweb/core/Resposive.dart';
import 'package:carweb/dashboard/screen/widgets/dashbordcontroller.dart';
import 'package:carweb/dashboard/screen/widgets/dealerdash.dart';
import 'package:carweb/dashboard/screen/widgets/maindashbord.dart';
import 'package:carweb/dashboard/screen/widgets/profilecontainer.dart';
import 'package:carweb/dashboard/screen/widgets/userdash.dart';
import 'package:carweb/dashboard/screen/widgets/vendor.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';



class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<dashbordcontroller>(
        init: dashbordcontroller(),
        builder: (logic) {
          return SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                colorconayner(),
                logic.dash==0? Padding(
                  padding: const EdgeInsets.only(top: 25,left: 20),
                  child: Dashmain(),
                ): logic.dash==1? Padding(
                  padding: const EdgeInsets.only(top: 25,left: 20),
                  child:Vendor()):  logic.dash==2? Padding(
                  padding: const EdgeInsets.only(top: 25,left: 20),
                  child:Dealerdash()):Userdash(),
              /*  SizedBox(width: 15*AppSizeConfig.heightMultiplier!,),
                Imagecontaoiner("Add vendor"),
                SizedBox(width: 3*AppSizeConfig.heightMultiplier!,),
                Imagecontaoiner("Add User"),
                SizedBox(width: 3*AppSizeConfig.heightMultiplier!,),
                Imagecontaoiner(" Add Dealer")
              //  Imagecontaoiner()*/

              ],
            ),
          );
        }
      ),
    );
  }

  Imagecontaoiner( String data){
    return Container(
      height: 10*AppSizeConfig.heightMultiplier!,
      width: 25*AppSizeConfig.widthMultiplier!,

      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add),
          Text(data),
        ],
      ),

    );
  }

}
