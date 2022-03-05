import 'package:carweb/core/Resposive.dart';
import 'package:carweb/dashboard/screen/widgets/userform.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class Userdash extends StatelessWidget {
  const Userdash({Key? key}) : super(key: key);

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
            Center(child: Text(" User Analytics", style: GoogleFonts.poppins(color: Colors.orangeAccent, fontWeight: FontWeight.bold, fontSize: 35),)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashborddata(Colors.red,"19000","Total Card washed"),
                dashborddata(Colors.green,"19000","Total User"),

                GestureDetector(
                  onTap: (){
Get.to(UserForm());
                  },
                  child: Padding(padding: EdgeInsets.only(top: 10),
                      child: Imagecontaoiner("Add User")),
                ),



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

  Imagecontaoiner(String data) {
    return Container(
      height: 10 * AppSizeConfig.heightMultiplier!,
      width: 25 * AppSizeConfig.widthMultiplier!,

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

