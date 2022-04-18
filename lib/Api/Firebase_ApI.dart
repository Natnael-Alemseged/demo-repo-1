import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:app/Common_Components/Firebase/Firebase.dart';

class FirebaseApi {
  static Future<UploadTask?> upload(
      String bookDestination,
      File book,
      String imageDestination,
      File image,
      String bookTitle,
      String bookPage,
      String language,
      String discription) async {
    try {
      //for book
      final bookRef = await FirebaseStorage.instance.ref(bookDestination);
      await bookRef.putFile(book);
      String BookUrl = (await bookRef.getDownloadURL()).toString();
      //for images
      final imageRef = await FirebaseStorage.instance.ref(imageDestination);
      await imageRef.putFile(image);
      String ImageURl = (await imageRef.getDownloadURL()).toString();

// now sending the data and url to be stored in firebase db
      storeInDB(BookUrl, ImageURl, bookTitle, bookPage, language, discription);
    } on FirebaseException catch (e) {
      Get.snackbar("couldn't upload ", e.toString());
    }
  }

  static Future storeInDB(
    String bookUrl,
    String imageURl,
    String bookTitle,
    String bookPage,
    String language,
    String discription,
  ) async {
    try {
      firestore.collection('Book').doc(bookTitle).set({
        'bookTitle': bookTitle,
        'bookPage': bookPage,
        'language': language,
        'bookUrl': bookUrl,
        'bookCover': imageURl,
        'discription': discription
      });
    } catch (e) {
      Get.snackbar('Could not upload data to database', e.toString());
    }
  }
}
