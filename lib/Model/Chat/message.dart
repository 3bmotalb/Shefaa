// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:graduation_project/themes.dart';

class Message {
  final String message;
  var senderid;

  Message(this.message, this.senderid);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[kMessage], jsonData?['senderid']);
  }
}
