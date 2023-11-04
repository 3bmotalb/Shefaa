import 'package:get/get.dart';
import 'package:graduation_project/Model/Home/Address/addresscontroller.dart';

class UserModel {
  String? birthdate;
  int? city;
  String? email;
  String? firstName;
  int? gender;
  int? government;
  String? governmentname;
  String? image;
  String? cityname;
  String? lastName;
  String? password;
  String? phone1;
  String? phone2;
  String? ssn;
  String? userid;

  UserModel({
    this.birthdate,
    this.city,
    this.cityname,
    this.email,
    this.firstName,
    this.gender,
    this.government,
    this.governmentname,
    this.image,
    this.lastName,
    this.password,
    this.phone1,
    this.ssn,
    this.userid,
    this.phone2,
  });

  UserModel.fromJson(Map<String, dynamic> json)  {
    addcontroller controller = Get.put(addcontroller());

    birthdate = json['birthdate'];
    city = json['city'];
    email = json['email'];
    firstName = json['first_name'];
    gender = json['gender'];
    government = json['government'];
    image = json['imageurl'];
    cityname =  controller.getcityname(json['city']);
    governmentname = controller.getgovname(json['government']);
    lastName = json['last_name'];
    password = json['password'];
    phone1 = json['phone1'];
    phone1 = json['phone2'];
    ssn = json['ssn'];
    userid = json['userid'];
  }
}
