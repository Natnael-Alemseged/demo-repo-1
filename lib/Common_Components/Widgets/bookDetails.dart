import 'package:app/Common_Components/Firebase/Firebase.dart';
import 'package:app/Common_Components/Widgets/comment.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app/Controller/Download/DownloadController.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:readmore/readmore.dart';
import 'package:app/Controller/Download/ratingController.dart';

class bookDetails extends StatefulWidget {
  var snapshot;
  bookDetails({Key? key, required DocumentSnapshot this.snapshot})
      : super(key: key);

  @override
  State<bookDetails> createState() => _bookDetailsState(snapshot: snapshot);
}

class _bookDetailsState extends State<bookDetails> {
  var snapshot;
  var download = Get.put(DownloadController());
  var rating = Get.put(ratingController());
  _bookDetailsState({required DocumentSnapshot this.snapshot});
  // ignore: empty_constructor_bodies

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          snapshot['bookTitle'],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 150,
                  height: 250,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 8, 0, 0),
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Ink.image(
                          image: CachedNetworkImageProvider(
                            snapshot['bookCover'],
                          ),
                          fit: BoxFit.cover,
                          child: InkWell(
                              onTap: () =>
                                  {} //Get.to(bookDetails(snapshot: snapshot),
                              // arguments: Transition.cupertino),
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Wrap(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Text(
                          snapshot['bookTitle'],
                          overflow: TextOverflow.visible,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 28, vertical: 5),
                        child: Text(
                          'Author: ' + snapshot['Author'],
                          overflow: TextOverflow.visible,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 90),
                        child: Align(
                            child: Row(
                          children: [
                            Text(double.parse((snapshot['Avg Rating'])
                                        .toStringAsFixed(1))
                                    .toString() +
                                '/5'),
                            Icon(
                              Icons.star_half_sharp,
                              color: Colors.amber,
                            )
                          ],
                        )),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Row(
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  // await download.downloadFile(
                                  //     bookUrl: snapshot['bookUrl'],
                                  //     bookName: snapshot['bookTitle'],
                                  //     bookImageUrl:snapshot['bookCover']);
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0))),
                                ),
                                child: const Text("Download"),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Align(
//                        alignment: Alignment.topRight,
                                child: Text('ETB ' +
                                    snapshot['Price'].toString() +
                                    '   '),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Book Discription',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.grey),
            ),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            ReadMoreText(snapshot['discription'],
                trimCollapsedText: 'Read More',
                trimExpandedText: 'Read Less',
                trimLines: 2,
                trimMode: TrimMode.Line,
                style: TextStyle(
                  fontSize: 16,
                )),
            Divider(
              thickness: 2,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                //width: 50,snapshot['bookTitle']
                child: ElevatedButton.icon(
                  onPressed: () async {
                    _showRatingAppDialog(snapshot);
                  },
                  icon: Icon(Icons.rate_review_sharp),
                  label: Text('Rate the Book'),
                ),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: firestore
                    .collection('Book')
                    .doc(snapshot.id)
                    .collection('Rating_Comment')
                    .limit(5)
                    .snapshots(),
                builder: (context, snapshots) {
                  return !snapshots.hasData
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : //SliverAlignedGrid.count(crossAxisCount:1 ,,itemBuilder: itemBuilder, crossAxisCount: crossAxisCount
                      Container(
                          height: 270,
                          child: ListView.separated(
                            padding: EdgeInsets.all(16),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshots.data!.docs.length,
                            separatorBuilder: (context, _) =>
                                SizedBox(width: 12),
                            itemBuilder: (context, index) {
                              DocumentSnapshot ds = snapshots.data!.docs[index];
                              return comment(
                                snapshot: ds,
                              );
                            },
                          ),
                        );
                }),
          ],
        ),
      ),
    );
  }

  void _showRatingAppDialog(DocumentSnapshot snapshot) {
    final _ratingDialog = RatingDialog(
      starColor: Colors.amber,
      title: Text('Rating Dialog In Flutter'),
      message: Text('Rating this app and tell others what you think.'
          ' Add more description here if you want.'),
      /*  image: Image.asset(
        "assets/images/1.png",
        height: 100,
      ), */
      submitButtonText: 'Submit',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, '
            'comment: ${response.comment}');
        rating.rateBook(
          rating: response.rating,
          comment: response.comment,
          docName: snapshot.id,
        );
        Get.snackbar(snapshot.id, 'message');
        if (response.rating < 3.0) {
          print('response.rating: ${response.rating}');
        } else {
          Container();
        }
      },
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => _ratingDialog,
    );
  }
}


/* Widget bookDetails({
  required DocumentSnapshot snapshot,
}) =>
   
 */