
import 'package:carweb/dashboard/screen/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{
 GlobalKey<FormState> key = GlobalKey();
String email= "" ;
String password= "" ;
TextEditingController emails = TextEditingController();
TextEditingController passwords = TextEditingController();
FirebaseAuth auth = FirebaseAuth.instance;




login() async{
print(emails.text);
Get.dialog(
  AlertDialog(
    title: Text("Loading......"),

    actions: <Widget>[
      Center(child: CircularProgressIndicator())
    ],
  ),
  barrierDismissible: false,
);
 var id = await auth.signInWithEmailAndPassword(email: emails.text, password:passwords.text).catchError((e){
   Get.back();
   Get.snackbar(
     "Invalid password or Email Id",
    "",
     icon: Icon(Icons.error, color: Colors.red),
     snackPosition: SnackPosition.BOTTOM,

   );
   print(e.printInfo('hello'));
 });





   storePerfernce(id.user!.uid);
Get.back();
   Get.to(Dashboard());

}

storePerfernce(String id) async{

 SharedPreferences prefs = await SharedPreferences.getInstance();
 await prefs.setString('id', id);
}
  emailValidations(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern.toString());
  if (value.length == 0) {
   return "email rewuried";
  }
  if (!regex.hasMatch(value))
   return "email requrid";
  else
   return '';
 }



}