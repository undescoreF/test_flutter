

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/model/localisation_model.dart';

import '../model/name_model.dart';
import '../model/person_model.dart';
import '../model/result_model.dart';
class DatabaseService{
  static Future<void> setupDatabase() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PersonneAdapter());
    Hive.registerAdapter(LocationAdapter());
    Hive.registerAdapter(StreetAdapter());
    Hive.registerAdapter(CoordinatesAdapter());
    Hive.registerAdapter(TimezoneAdapter());
    Hive.registerAdapter(NameAdapter());
    Hive.registerAdapter(ResultsAdapter());
    Hive.registerAdapter(LoginAdapter());
    Hive.registerAdapter(DobAdapter());
    Hive.registerAdapter(IdAdapter());
    Hive.registerAdapter(PictureAdapter());
  }
  static Future<List<Personne>> getAllPer() async{
      Box<Personne> box;
    try{
       box = await Hive.openBox<Personne>("PERSONNES");
    }catch(e){
       box = await Hive.box<Personne>('PERSONNES');
    }
    return box.values.toList();
  }
static Future<List<Personne>> pers() async {
    List<Personne> list=[];
 final  box = await Hive.box<Personne>('PERSONNES');
  for(final i in box.values.toList()){
    list.add(i);
  }
  return list;
}

  Future<List<Personne>> loadPreloadedData() async {
    final jsonData = await rootBundle.loadString('assets/randomuser.json');
    final decodedData = jsonDecode(jsonData);
    final results = decodedData['results'];
    final users = <Personne>[];
    for (var item in results) {
      final personne = Personne.fromJson(item);
      users.add(personne);
    }
    return users;
  }
  static Future<void> deleteUser(int index) async {
    final box = Hive.box<Personne>('PERSONNES');
    await box.deleteAt(index);
  }
  static Future<void> updateUser(int index, Personne p) async{
    final box = Hive.box<Personne>('PERSONNES');
    box.putAt(index, p);
  }
}
Future<void> addUser() async {
  final jsonData = await rootBundle.loadString('assets/randomuser.json');
  final decodedData = jsonDecode(jsonData);
  final results = decodedData['results'];
  Box<Personne> box;
  try{
    box = await Hive.box<Personne>('PERSONNES');
  }catch(e){
    box = await Hive.openBox<Personne>("PERSONNES");
    if(box.values.toList().length<100){
      for (var item in results) {
        Map<String, dynamic> data = {"results": item};
        final personne = Personne.fromJson(data);
        box.add(personne);}
    }

  }
}



