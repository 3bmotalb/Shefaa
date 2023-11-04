// ignore_for_file: non_constant_identifier_names

import 'package:graduation_project/DB/Models/M_user/user.dart';

// ignore: camel_case_types
class comment {
  String? text;
  int? rate;
  String? userid;
  UserModel? user;

  comment({this.text, this.rate, this.userid});

  comment.fromJson(Map<String, dynamic> json, UserModel UserStore) {
    text = json['comment'];
    rate = json['rate'];
    userid = json['userid'];
    user = UserStore;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comment'] = text;
    data['rate'] = rate;
    data['userid'] = userid;
    return data;
  }
}
