// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project/DB/Models/M_Appointment/Appointment.dart';
import 'package:graduation_project/DB/Models/M_user/user.dart';

import '../M_nurse/nurse_model.dart';

class RequestTest {
  String? id;
  String? nurseid;
  Timestamp? requestdate;
  String? status;
  UserModel? UserStore;
  NurseModel? NurseStore;
  String? userid;
  String? appid;
  appointment? app;
  List<dynamic>? services;
  String? address;
  String? description;

  RequestTest(
      {this.id,
      this.nurseid,
      this.requestdate,
      this.status,
      this.UserStore,
      this.NurseStore,
      this.userid,
      this.appid,
      this.app,
      this.services,
      this.address,
      this.description});

  RequestTest.fromJson(Map<String, dynamic> json, UserModel user,
      appointment appstore, String requestid) {
    id = requestid;
    nurseid = json['nurseid'];
    requestdate = json['createdAt'];
    status = json['status'];
    UserStore = user;
    userid = json['userid'];
    appid = json['appointment_id'];
    app = appstore;
    address=json['address'];
    description=json['details'];
  }
  RequestTest.fromJsontouser(Map<String, dynamic> json, NurseModel nurse,
      appointment appstore, String requestid) {
    id = requestid;
    nurseid = json['nurseid'];
    requestdate = json['createdAt'];
    status = json['status'];
    NurseStore = nurse;
    userid = json['userid'];
    appid = json['appointment_id'];
    app = appstore;
    services = json['services'];
  }
}
