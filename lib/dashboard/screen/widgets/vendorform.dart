import 'package:carweb/core/Resposive.dart';
import 'package:carweb/core/colors.dart';
import 'package:carweb/dashboard/screen/widgets/vendorformcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

class vendorform extends StatelessWidget {
  const vendorform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VendorFormcontroller >(
      init: VendorFormcontroller (),
      builder: (logic) {
        return Scaffold(
          body: Center(
            child: Form(
              key: logic.key,
              child: SingleChildScrollView(
                child: Container(
                  width: 500,
                  height: 700,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Title(color: Colors.green, child: Text("Add Vendor", style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),)),
                  Textfiled("email", Icons.email,logic.email,false),
                      Textfiled("Password", Icons.password,logic.password,true),
                      Textfiled("Name of the Company", Icons.cases,logic.name,false),
                      Textfiled("Lattitude", Icons.location_on_outlined,logic.lat,false),
                      Textfiled("Logitiude", Icons.location_on_outlined,logic.long,false),
                      Textfiled("Contact Number", Icons.mobile_friendly,logic.conatct,false),
                      Textfiled("Time", Icons.timer_sharp,logic.time,false),
                   GestureDetector(
                     onTap: (){
                       if(logic.key.currentState!.validate()){
                         logic.craeteuser();
                       }
                     },
                     child: Padding(padding: EdgeInsets.only(top: 50),

                       child: Buttons("Create")),
                   )
                    ],
                  ),
                ),
              ),
            ),
          ),

        );
      }
    );
  }


  Widget Textfiled(String hint, IconData icon, TextEditingController controller, bool sure ){
    return Container(
      height: 5*AppSizeConfig.heightMultiplier!,
      width: 45*AppSizeConfig.widthMultiplier!,
      child:  TextFormField(
        obscureText: sure,
        controller: controller,
        validator: ValidationBuilder()
            .minLength(1)
            .build(),
        decoration: InputDecoration(
            focusColor: Colors.grey,


            hintText: hint,
            icon: Icon(icon, color: logintext,),
            disabledBorder: InputBorder.none

        ),
      ) ,
    );
  }

  Buttons(String name){
    return Container(
      height: 5*AppSizeConfig.heightMultiplier!,
      width: 50*AppSizeConfig.widthMultiplier!,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.red
      ),
      child: Center(child: Text(name,style: GoogleFonts.openSans(fontSize: 2.5*AppSizeConfig.textMultiplier!,color: Colors.white, fontWeight: FontWeight.bold))) ,

    );
  }


}




