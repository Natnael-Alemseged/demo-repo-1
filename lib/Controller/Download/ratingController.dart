import 'package:get/get.dart';
import 'package:app/Common_Components/Firebase/Firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:app/Controller/Authentication/UserBox.dart';

class ratingController extends GetxController {
  void getRating() async {}

  void rateBook(
      {required double rating,
      String comment = "",
      required String docName}) async {
    try {
      //get email form user hive box
      final mybox = UserBox.getUser();
      final user = mybox.get(0);
      var email = user?.email;
      var firstName = user!.firstName.toString();
      var lastName = user.lastName.toString();

      //add rating an comment to book using the email as a document Id
      await firestore
          .collection('Book')
          .doc(docName)
          .collection('Rating_Comment')
          .doc(email)
          .set({
        'rating': rating,
        'comment': comment,
        'by': firstName + ' ' + lastName,
        'time': Timestamp.now(),
      });
      print('sucessfully added comment');

      await calculateAvarageRating(rating, docName);
    } catch (e) {
      print(e.toString());
      Get.snackbar(e.toString(), 'failed to add rating to db');
    }
  }

  calculateAvarageRating(var rating, String docName) async {
    try {
      //get current Avarage Rating of the bookfrom firestore
      await firestore
          .collection('Book')
          .doc(docName)
          .get()
          .then<dynamic>((DocumentSnapshot snapshot) async {
        //current rating
        var currentAvgRating = await snapshot['Avg Rating'];
        var avgRating;
        //get total number of user ratings
        QuerySnapshot _myDoc = await firestore
            .collection('Book')
            .doc(docName)
            .collection('Rating_Comment')
            .get();
        List<DocumentSnapshot> _myDocCount = _myDoc.docs.toList();
        //number of ratings
        var ratingCount = _myDocCount.length;
        //get total number of ratrs
        if (ratingCount == 1) {
          avgRating = rating;
        } else {
          var b = ratingCount - 1;
          var sumrating = currentAvgRating * b;
          sumrating = sumrating + rating;
          avgRating = sumrating / ratingCount;
        }

        //number of ratings after the this operation

        //calculate total number of rating

        await firestore
            .collection('Book')
            .doc(docName)
            .update({'Avg Rating': avgRating});
      });
    } catch (e) {
      Get.snackbar('failed couldn"t calculate avarage rating', e.toString());
    }
  }
}
