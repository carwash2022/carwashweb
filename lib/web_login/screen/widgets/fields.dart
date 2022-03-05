
import 'package:carweb/core/Resposive.dart';
import 'package:carweb/core/colors.dart';
import 'package:carweb/web_login/screen/widgets/logincontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

class Fields extends StatefulWidget {
  const Fields({Key? key}) : super(key: key);

  @override
  _FieldsState createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
   return  GetBuilder<LoginController>(
     init: LoginController(),
     builder: (logics) {
       return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                children: [
                  SizedBox(height: 2*AppSizeConfig.heightMultiplier!,),



                  Center(child: Text(" Super Login,",style: GoogleFonts.poppins(fontSize: 2.5*AppSizeConfig.textMultiplier!, fontWeight: FontWeight.bold,color: logintext ),),
                  ),
                  SizedBox(height: 4*AppSizeConfig.heightMultiplier!,),
                //  Assetsimage(),
               //   Center(child: Text("Login",style: GoogleFonts.poppins(fontSize: 4.0*AppSizeConfig.textMultiplier!, fontWeight: FontWeight.bold,color:Color(0xef7174d0) ),),),
                  SizedBox(height: 2*AppSizeConfig.heightMultiplier!,),
                  Textfiled("Email", Icons.email,logics.emails, false),
                  SizedBox(height: 2*AppSizeConfig.heightMultiplier!,),
                  Textfiled("Password",Icons.password, logics.passwords, true  ),
                  SizedBox(height: 2*AppSizeConfig.heightMultiplier!,),
GestureDetector(
  onTap: (){
    if(key.currentState!.validate()){
      logics.login();
    }

  },
  child:
                  Buttons("Login"),),
                ],
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
          color: Color(0xef0124fb)
      ),
      child: Center(child: Text(name,style: GoogleFonts.openSans(fontSize: 2.5*AppSizeConfig.textMultiplier!,color: Colors.white, fontWeight: FontWeight.bold))) ,

    );
  }


}
