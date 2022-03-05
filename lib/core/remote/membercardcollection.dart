import 'package:carweb/model/member_card_collection_model/member_collection_model.dart';
import 'package:dio/dio.dart';

class Api{



  Future<MemberCardCollectionModel>  getMemberCardColection() async {
    var result = await  Dio().get("https://us-central1-carwash-bd593.cloudfunctions.net/app/getCollectionsbyDocId/MemberCard/none",
options: Options(
headers: {


}
)
    );

 print(" result=========>${result.statusCode}");
  if(result.statusCode==200){
    return  MemberCardCollectionModel.fromJson(result.data);
  }
  throw("error");

  }


  getcarwash() async {
    var result = await  Dio().get("https://us-central1-carwash-bd593.cloudfunctions.net/app/getCollectionsbyDocId/carwashscan/none",
        options: Options(
            headers: {


            }
        )
    );

    print(" result=========>${result.statusCode}");
    if(result.statusCode==200){
      return  result.data;
    }
    throw("error");

  }


  getdealer() async {
    var result = await  Dio().get("https://us-central1-carwash-bd593.cloudfunctions.net/app/getCollectionsbyDocId/dealer/none",
        options: Options(
            headers: {


            }
        )
    );

    print(" result=========>${result.statusCode}");
    if(result.statusCode==200){
      return  result.data;
    }
    throw("error");

  }

  getvendor() async {
    var result = await  Dio().get("https://us-central1-carwash-bd593.cloudfunctions.net/app/getCollectionsbyDocId/vendor/none",
        options: Options(
            headers: {


            }
        )
    );

    print(" result=========>${result.statusCode}");
    if(result.statusCode==200){
      return  result.data;
    }
    throw("error");

  }

  getuser() async {
    var result = await  Dio().get("https://us-central1-carwash-bd593.cloudfunctions.net/app/getCollectionsbyDocId/user/none",
        options: Options(
            headers: {


            }
        )
    );

    print(" result=========>${result.statusCode}");
    if(result.statusCode==200){
      return  result.data;
    }
    throw("error");

  }



}