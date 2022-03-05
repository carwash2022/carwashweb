class MemberCardCollectionModel {
  final String? msg;
  final List<Data>? data;

  MemberCardCollectionModel({
    this.msg,
    this.data,
  });

  MemberCardCollectionModel.fromJson(Map<String, dynamic> json)
      : msg = json['msg'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'msg' : msg,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final String? date;
  final String? contact;
  final String? carmodel;
  final String? carnumber;
  final String? name;
  final String? vendorid;
   final String? card;
  final String? email;

  Data({
    this.date,
    this.contact,
    this.carmodel,
    this.carnumber,
    this.name,
    this.vendorid,
    this.card,
    this.email,
  });

  Data.fromJson(Map<String, dynamic> json)
      : date = json['date'] as String?,
        contact = json['contact'] as String?,
        carmodel = json['carmodel'] as String?,
        carnumber = json['carnumber'] as String?,
        name = json['name'] as String?,
        vendorid = json['vendorid'] as String?,
        card = json['card'] as String?,
        email = json['email'] as String?;

  Map<String, dynamic> toJson() => {
    'date' : date,
    'contact' : contact,
    'carmodel' : carmodel,
    'carnumber' : carnumber,
    'name' : name,
    'vendorid' : vendorid,
    'card' : card,
    'email' : email
  };
}