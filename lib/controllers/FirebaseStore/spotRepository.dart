// ignore_for_file: file_names

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AddSpotRepository extends GetxController {
  static AddSpotRepository get instance => Get.find();

 // final _db = FirebaseFirestore.instance;

  // createPost({required PostModel postModel, required String id}) async {
  //   await _db.collection(id).add(postModel.toJson()).then((res) {
  //     Get.off(() => const StatusScreen());
  //   }).catchError((error, stackTrace) => Utilis.snackBar(
  //         title: 'Failed',
  //         message: 'Uploading spot is failed!',
  //       ));
  // }
Future<List<String>> uploadFiles({required List<File> images,required String id,required String imageId}) async {
  List<String> imageUrls = await Future.wait(images.map((image) => uploadImages(file: image,id: id,imageId: imageId)));
  print(imageUrls);
  return imageUrls;
}

  Future<String> uploadImages({required File file, required String id,required String imageId}) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final fileName = file.path.split("/").last;
      final timeStamp = DateTime.now().microsecondsSinceEpoch;
      final uploadRef = storageRef.child("spotImages/$id/$imageId/$timeStamp-$fileName");
      await uploadRef.putFile(file);
      final islandRef = storageRef.child("spotImages/$id/$imageId/$timeStamp-$fileName");
      final data = await islandRef.getDownloadURL();
      return data;
    } catch (e) {
      debugPrint(e.toString());
    }
    return '';
  }

  // Future<List<PostModel>?> getAddedPosts({required String id}) async {
  //   final snapShot = await _db.collection(id).orderBy('AddedDate',descending: true).get();
  //   final userData =
  //       snapShot.docs.map((e) => PostModel.fromSnapshot(e)).toList();
  //   return userData;
  // }

  // deleteImage(String url) async {
  //   return FirebaseStorage.instance.refFromURL(url).delete();
  // }
}
