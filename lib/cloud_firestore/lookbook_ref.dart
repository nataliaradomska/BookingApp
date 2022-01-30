

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/model/image_model.dart';
import 'package:first_app/model/user_model.dart';
import 'package:flutter/cupertino.dart';

Future<List<ImageModel>> getLookbook() async {
  List<ImageModel> result = new List<ImageModel>.empty(growable: true);
  CollectionReference bannerRef = FirebaseFirestore.instance.collection('Lookbook');
  QuerySnapshot snapshot = await bannerRef.get();
  snapshot.docs.forEach((element) {
    result.add(ImageModel.fromJson(element.data()));
  });
  return result;
}