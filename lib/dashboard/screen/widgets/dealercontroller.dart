import 'package:carweb/dashboard/screen/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class dealercontroller extends GetxController{



  TextEditingController email = TextEditingController();
  TextEditingController conatct = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  GlobalKey<FormState>  key = GlobalKey();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;



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

    var resultcontact= await firestore.collection("dealer").where('contact',isEqualTo: conatct.text).get();
   print(resultcontact.docs.length);
   print(resultcontact.docs.length);
    UserCredential id= await auth.createUserWithEmailAndPassword(email: email.text, password: password.text).catchError((e){
      Get.back();
      print(e);
      Get.snackbar(
        "Email Already Exist or Sever error",
        "",
        icon: Icon(Icons.error, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    );



    var date = DateTime.now();

print('hello');
print(id.user!.uid);
firestore.collection("dealer").doc(id.user!.uid).set({
      "name":name.text,
      "date":date.toString(),
      "contact":conatct.text,
      "email":email.text,
      "dealerid":id.user!.uid.toString(),

    }).then((value){


      Get.to(Dashboard());}).catchError((error) => print("Failed to add user: $error"));
print("hello");



  }




  getdata() async{
    print("hello");
     await firestore.collection("MemberCard").snapshots().map((
        QuerySnapshot query) {
      print(query.docs[3]["name"]);

      });

  }










}