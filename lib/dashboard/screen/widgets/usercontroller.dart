import 'package:carweb/core/remote/membercardcollection.dart';
import 'package:carweb/dashboard/screen/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  TextEditingController email = TextEditingController();
  TextEditingController conatct = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController carnumber = TextEditingController();
  TextEditingController carmodel = TextEditingController();
  TextEditingController membercardid = TextEditingController();

  GlobalKey<FormState>  key = GlobalKey();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  String?  data ;

  craeteuser() async{

    Get.dialog(
      AlertDialog(
        title: Text("Loading......"),

        actions: <Widget>[
          Center(child: CircularProgressIndicator())
        ],
      ),
      barrierDismissible: false,
    );

    var result = await Api().getMemberCardColection();
    for(int i =0; i<result.data!.length; i++){
      if(result.data![i].card==membercardid.text){

        print ("yes");
        data= "true";
        print(data);
        Get.back();
        Get.snackbar(
          "Card already Exist!!",
          "",
          icon: Icon(Icons.error, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
        );
        break;
      }  else {
        data= "false";
        print(data);
      }
    }
if(data=="false") {

  print(" enter data");
  UserCredential id= await auth.createUserWithEmailAndPassword(email: email.text, password: password.text).catchError((e){
    Get.back();
    Get.snackbar(
      "Email Already Exist or Sever error",
      "",
      icon: Icon(Icons.error, color: Colors.red),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  );






  var date = DateTime.now();
  Get.dialog(
    AlertDialog(
      title: Text("Loading......"),

      actions: <Widget>[
        Center(child: CircularProgressIndicator())
      ],
    ),
    barrierDismissible: false,
  );
print("add data");

  firestore.collection("MemberCard").doc(id.user!.uid).set({
    "name": name.text,
    "date": date.toString(),
    "contact": conatct.text,
    "email": email.text,
    "carnumber": carnumber.text,
    "carmodel": carmodel.text,
    "Membercardid": membercardid.text,
    "userid": id.user!.uid,
    "date": date.toString(),
  });

  firestore.collection("user").doc(id.user!.uid).set({
    "name": name.text,
    "date": date.toString(),
    "contact": conatct.text,
    "email": email.text,
    "carnumber": carnumber.text,
    "carmodel": carmodel.text,
    "Membercardid": membercardid.text,
    "userid": id.user!.uid,
    "date": date.toString(),
  }).then((value) => Get.to(Dashboard())).catchError((error) {
    print(error);
  }

  );
}
  }





}