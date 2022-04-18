import 'package:app/Common_Components/Firebase/Firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:app/Common_Components/Widgets/BuildCard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class CardItem {
  final String urlImage;
  final String title;
  final String subtitle;
  const CardItem(
      {required this.urlImage, required this.subtitle, required this.title});
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: StreamBuilder<QuerySnapshot>(
          stream: firestore.collection('Book').limit(5).snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : //SliverAlignedGrid.count(crossAxisCount:1 ,,itemBuilder: itemBuilder, crossAxisCount: crossAxisCount
                Container(
                    height: 270,
                    child: ListView.separated(
                      padding: EdgeInsets.all(16),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      separatorBuilder: (context, _) => SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data!.docs[index];
                        return BuildCard(
                          snapshot: ds,
                        );
                      },
                    ),
                  );

            /* FutureBuilder(
        future: ,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //Build you UI
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    ); */
            /*  Container(
        height: 270,
        child: ListView.separated(
          padding: EdgeInsets.all(16),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          separatorBuilder: (context, _) => SizedBox(width: 12),
          itemBuilder: (context, index) => BuildCard(item: items[index]),
        ),
      ),
    ); */

            //     CustomScrollView(
            //   slivers: [
            //     //SliverPersistentHeader(pinned:true, delegate: SearchDelegate()),
            //     StreamBuilder<QuerySnapshot>(
            //         stream: firestore
            //             .collection("Book")
            //             .orderBy('bookTitle', descending: true)
            //             .snapshots(),
            //         builder: (context, dataSnapshot) {
            //           return !dataSnapshot.hasData
            //               ? SliverToBoxAdapter(
            //                   child: Center(
            //                     child: CircularProgressIndicator(),
            //                   ),
            //                 )
            //               : SliverGrid.count(
            //                   crossAxisCount: 1,
            //                 );
            //         }),
            //   ],
            // ),
          }),
    );
  }
}
