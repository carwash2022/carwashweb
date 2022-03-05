import 'package:carweb/core/remote/membercardcollection.dart';
import 'package:carweb/model/member_card_collection_model/member_collection_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class dashbordcontroller  extends GetxController{
  int dash =0;
var membercard = MemberCardCollectionModel().obs;
var totalcard = '0';
var  totalvendor = '0';
var totaldealer = '0';
var totalcarwash= '0';

  @override
  void onInit() {
    updates();
    getmembercollection();
    super.onInit();
  }


  FirebaseFirestore firestore = FirebaseFirestore.instance;



  widgetupdate(int index){
    dash=index;
    update();
  }


  updates() async{
    print("hello");
    try {firestore.collection('MemberCard').snapshots().map((
              QuerySnapshot query) {
            print(query.docs[0]["name"]);

            });

          }

     catch(e){
      print("exp ${e}");
    }





  }


  getmembercollection()async{
var result = await Api().getMemberCardColection();

var a = await Api().getcarwash();
 var b = await Api().getdealer();
 var c = await Api().getvendor();
totalcarwash = a["data"].length.toString();
totaldealer = b["data"].length.toString();
totalvendor = await c["data"].length.toString();



totalcard= result.data!.length.toString();
update();

  }






}