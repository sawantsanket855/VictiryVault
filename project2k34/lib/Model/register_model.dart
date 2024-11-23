import 'package:flutter/material.dart';

class Registermodel{
  String name ;
  String email;
  String mobile;
  String department;
  String role ;
  Registermodel({required this.department, required this.role, required this.name,  required this.email, required this.mobile,});

  Map<String,dynamic> tomap(){
    return {
      'name': name,
      'email': email,
      'mobile': mobile,
      'department': department,

    };
  }
  
}