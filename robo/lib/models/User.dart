import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Userr {
  String? email;
  String? password;
  String? role;


  //User({this.username, this.password});
  Userr(
    this.email ,
    this.password ,
    this.role) ;


  Userr.fromMap(Map<String, dynamic> map)
      : assert(map['username'] != null),
        assert(map['password'] != null),
        assert(map['role'] != null),
        email = map['email'],
        password = map['password'],
        role = map['role'];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['role'] = this.role;
    return data;
  }

//Map<String, dynamic> toMap() {}
}