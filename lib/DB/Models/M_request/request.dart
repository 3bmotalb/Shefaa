import 'package:cloud_firestore/cloud_firestore.dart';

class RequestModel {
  String? nurseid;
  Timestamp? requestdate;
  String? status;
  String? userName;
  String? userImage;
  String? userid;
  String? appid;

  RequestModel(
      {this.nurseid,
      this.requestdate,
      this.status,
      this.userName,
      this.userImage,
      this.userid,
      this.appid});

  RequestModel.fromJson(Map<String, dynamic> json) {
    nurseid = json['nurseid'];
    requestdate = json['createdAt'];
    status = json['status'];
    userName = json['user_name'];
    userImage = json['user_image'];
    userid = json['userid'];
    appid = json['appointment_id'];
  }

 
}
