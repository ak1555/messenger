import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
 class Pro extends ChangeNotifier{
  final mybox=Hive.box('mybox');

 String? _uid;
 String? get uid=>_uid;

 void setUid(String uid){
  _uid=uid;
  // mybox.add(1,_uid.toString());
  mybox.put(1, _uid);
  notifyListeners();
 }
 }