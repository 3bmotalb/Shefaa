import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String? lastmessage;
  String? chatid;
  Timestamp? time;

  ChatModel({this.lastmessage, this.chatid, this.time});

  ChatModel.fromJson(Map<String, dynamic> json) {
    lastmessage = json['lastmessage'];
    chatid = json['chatid'];
    time = json['lasttime'];
  }

}