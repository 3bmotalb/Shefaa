import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DoctorModel {
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
  String? professionaltitle;
  String? category;
  String? categoryid;
  String? bio;
  String? bio_en;
  String? education;
  String? clinic_name;
  String? clinic_address;
  String? clinic_description;
  String? clinic_phone;
  int? vezeta;
  List<dynamic>? lang = [];
  bool? status;
  String? image;
  String? licence;

  DoctorModel({
    this.birthdate,
    this.email,
    this.firstName,
    this.gender,
    this.rate,
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
    this.lang,
    this.image,
    this.password,
    this.grad_year,
    this.clinic_address,
    this.vezeta,
  });

  DoctorModel.fromJson(
      Map<String, dynamic> json, String catname, String? city, String? gov) {
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
    title = json['title'];
    professionaltitle = json['Professional_title'.tr];
    education = json['education'.tr];
    lang = json['langs'];
    grad_year = json['graduation'];
    image = json['profile_url'];
    licence = json['licence_url'];
    status = json['status'];
    govname = gov;
    cityname = city;
    category = catname;
    clinic_name = json['clinical_name'.tr];
    clinic_address = json['clinical_address'.tr];
    clinic_description = json['clinical_description'.tr];
    clinic_phone = json['clinical_phone'];
    vezeta = json['vezeta'];
  }
}
