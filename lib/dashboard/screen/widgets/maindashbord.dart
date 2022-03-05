import 'package:carweb/dashboard/screen/widgets/dashbordcontroller.dart';
import 'package:carweb/dashboard/screen/widgets/dealercontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashmain extends StatelessWidget {

  final dashboardcontroller = Get.put(dashbordcontroller ());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 600,
        width: 1100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          children: [
            Center(child: Text("Analytics", style: GoogleFonts.poppins(color: Colors.orangeAccent, fontWeight: FontWeight.bold, fontSize: 35),)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            dashborddata(Colors.red,"${dashboardcontroller.totalcard}","Total Card Issued"),
                dashborddata(Colors.green,"${dashboardcontroller.totalvendor}","Total vendor"),
                dashborddata(Colors.pink,"${dashboardcontroller.totaldealer}","Total Dealers"),
                dashborddata(Colors.deepPurple,"${dashboardcontroller.totalcarwash}","Total Car wash"),

              ],
            )


          ],
        ),


      ),
    );
  }


  dashborddata(Color color, String Title, String numbers){
   return Container(
     height: 150,
     width: 250,
     decoration: BoxDecoration(
       color: color,
       borderRadius: BorderRadius.circular(10)
     ),
     child: Column(
       children: [
         SizedBox(height: 25,),
         Text(Title,style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 33)),
         Text(numbers,style: GoogleFonts.poppins(color: Colors.white, fontSize: 20))
       ],
     ),

    );
  }

}
