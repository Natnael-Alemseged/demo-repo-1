import 'package:app/Common_Components/Firebase/Firebase.dart';
import 'package:get/get.dart';
import 'package:app/Model/Book/book_Model.dart';

class Home_Controller extends GetxController {
  //declare is loading variable as observable
  var isLoading = true.obs;
//
  var bookList = <book_Model>[].obs;
  //calling oninit to tintialize FetchData Method
  @override
  void onInit() {
    FetchData();
    super.onInit();
  }

  void FetchData() async {
    try {
      isLoading(true);
      var x = firestore
          .collection('Book')
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
      if (x != null) {}
    } catch (e) {}
  }
}
