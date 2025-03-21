// import 'package:flutter/material.dart';


// class BookCard extends StatelessWidget {
//   final String img;
//   final Entry entry;

//   BookCard({
//     Key? key,
//     required this.img,
//     required this.entry,
//   }) : super(key: key);

//   static final uuid = Uuid();
//   final String imgTag = uuid.v4();
//   final String titleTag = uuid.v4();
//   final String authorTag = uuid.v4();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 120.0,
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10.0),
//           ),
//         ),
//         elevation: 4.0,
//         child: InkWell(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10.0),
//           ),
//           onTap: () {
//             MyRouter.pushPage(
//               context,
//               Details(
//                 entry: entry,
//                 imgTag: imgTag,
//                 titleTag: titleTag,
//                 authorTag: authorTag,
//               ),
//             );
//           },
//           child: ClipRRect(
//             borderRadius: BorderRadius.all(
//               Radius.circular(10.0),
//             ),
//             child: Hero(
//               tag: imgTag,
//               child: CachedNetworkImage(
//                 imageUrl: '$img',
//                 placeholder: (context, url) => LoadingWidget(
//                   isImage: true,
//                 ),
//                 errorWidget: (context, url, error) => Image.asset(
//                   'assets/images/place.png',
//                   fit: BoxFit.cover,
//                 ),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }