// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class appointment {
  Timestamp? date;
  int? price;
  bool? booked;
  String? time;
  String? id;

  appointment({this.date, this.price, this.booked,this.time,this.id});

  appointment.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    price = json['price'];
    booked = json['booked'];
    time = json['time'];
    id = json['id'];
  }

  Map<String, dynamic> toJson(appointment app) {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['date'] = date;
    data['price'] = price;
    data['booked'] = booked;
    data['time'] = time;
    data['id'] = id;
    return data;
  }
}
