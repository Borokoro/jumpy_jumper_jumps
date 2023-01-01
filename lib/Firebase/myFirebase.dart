import 'dart:async';
import 'dart:core';
import 'package:jumpy_jumper_jumps/variables.dart' as variables;
import 'package:cloud_firestore/cloud_firestore.dart';

class MyFirebase{
  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection("leaderboard");

  Future<void> setData(List<String> users, List<int> photos, List<int> score) async{
    await userCollection.doc('data').set({'user': users, 'photo': photos, 'score': score, 'data': 'data'});
  }

  Future<List<String>> getUser() async{
    List<dynamic> getter=<dynamic>[];
    await FirebaseFirestore.instance
        .collection('leaderboard')
        .where('data', isEqualTo: 'data')
        .get()
        .then((QuerySnapshot result) => {
      result.docs.forEach((element) {
        getter=element["user"];
      })
    });
    print(getter.length);
    return getter.map((e) => e.toString()).toList();
  }

  Future<List<int>> getPhotos() async{
    List<dynamic> getter=<dynamic>[];
    await FirebaseFirestore.instance
        .collection('leaderboard')
        .where('data', isEqualTo: 'data')
        .get()
        .then((QuerySnapshot result) => {
      result.docs.forEach((element) {
        getter=element["photo"];
      })
    });
    return getter.map((e) => int.parse(e.toString())).toList();
  }

  Future<List<int>> getScore() async{
    List<dynamic> getter=<dynamic>[];
    await FirebaseFirestore.instance
        .collection('leaderboard')
        .where('data', isEqualTo: 'data')
        .get()
        .then((QuerySnapshot result) => {
      result.docs.forEach((element) {
        getter=element["score"];
      })
    });
    return getter.map((e) => int.parse(e.toString())).toList();
  }
}