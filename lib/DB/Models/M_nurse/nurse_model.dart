import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class NurseModel {
  String? userid;
  String? firstName;
  String? lastName;
  String? full_name;
  String? full_name_en;
  String? email;
  String? password;
  String? ssn;
  String? phone1;
  Timestamp? birthdate;
  Timestamp? grad_year;
  int? cityid;
  int? govid;
  String? cityname;
  String? govname;
  int? gender;
  double? rate;
  String? title;
  String? bio;
  String? bio_en;
  String? education;
  List<dynamic>? lang = [];
  List<dynamic>? services;
  List<dynamic>? work;
  List<dynamic>? time;
  String? workplace;
  String? another_ar;
  String? another_en;
  bool? status;
  String? image;
  String? licence;

  NurseModel({
    this.birthdate,
    this.email,
    this.firstName,
    this.gender,
    this.rate,
    this.another_ar,
    this.another_en,
    this.bio,
    this.bio_en,
    this.cityid,
    this.govid,
    this.cityname,
    this.full_name,
    this.full_name_en,
    this.govname,
    this.lastName,
    this.licence,
    this.phone1,
    this.ssn,
    this.status,
    this.title,
    this.userid,
    this.work,
    this.workplace,
    this.time,
    this.lang,
    this.services,
    this.image,
    this.password,
    this.grad_year,
  });

  NurseModel.fromJson(Map<String, dynamic> json, String? city, String? gov) {
    userid = json['userid'];
    email = json['email'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    full_name = json['full_name'.tr];
    ssn = json['ssn'];
    phone1 = json['phone1'];
    birthdate = json['birthdate'];
    govid = json['government'];
    cityid = json['city'];
    var temp=json['rate'];
    rate = temp.toDouble();
    bio = json['bio'.tr];
    title = json['title'.tr];
    education = json['education'.tr];
    //anotherServices = json['another_services'.tr];
    services = json['services'];
    lang = json['langs'];
    time = json['time'];
    work = json['work'];
    workplace = json['work_address'];
    grad_year = json['graduation'];
    image = json['profile_url'];
    licence = json['licence_url'];
    status = json['status'];
    govname = gov;
    cityname = city;
  }
}
