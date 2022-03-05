import 'package:carweb/dashboard/screen/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorFormcontroller extends GetxController{
  TextEditingController email = TextEditingController();
  TextEditingController conatct = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController lat = TextEditingController();
  TextEditingController long = TextEditingController();
  TextEditingController time = TextEditingController();
  GlobalKey<FormState>  key = GlobalKey();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  craeteuser() async{

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

  firestore.collection("vendor").doc(id.user!.uid).set({
    "name":name.text,
    "date":date.toString(),
    "contact":conatct.text,
    "email":email.text,
    "lat":lat.text,
    "long":long.text,
    "time":time.text,
    "vendorid":id.user!.uid,
    "date":date.toString(),
  }).then((value)=> Get.to(Dashboard())).catchError((error){
    print(error);
  }

  );


  }

  }


