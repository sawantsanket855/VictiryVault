import 'dart:io';
import 'dart:developer';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageOperation {

    Future<void> uploadeImage({required String fileName,required  XFile selectedFile}) async {
    await FirebaseStorage.instance
        .ref()
        .child(fileName)
        .putFile(File(selectedFile.path));
    print("Success");
  }
  //new commit 
   Future<String> downloadImgUrl({ required String fileName}) async {
    String url =
        await FirebaseStorage.instance.ref().child(fileName).getDownloadURL();
    return url;
  }


  static Future<XFile?> pickImage({ImageSource source = ImageSource.gallery}) async {
    final ImagePicker picker = ImagePicker();
    try {
      return await picker.pickImage(source: source);
    } catch (e) {
      log("Error picking image: $e");
      return null;
    }
  }
}
