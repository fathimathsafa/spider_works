// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:news_spider/core/constants/colors.dart';
// import 'package:news_spider/core/constants/text_styles.dart';
// import 'package:news_spider/presentation/details_screen/controller/details_controller.dart';

// import 'package:provider/provider.dart';

// class NewsDetailScreen extends StatefulWidget {
//   const NewsDetailScreen({super.key, required this.slug});

//   final String slug;

//   @override
//   State<NewsDetailScreen> createState() => _NewsDetailScreenState();
// }

// class _NewsDetailScreenState extends State<NewsDetailScreen> {
//   fetchData() {
//     Provider.of<NewsDetailsController>(context, listen: false)
//         .fetchData(widget.slug);
//   }

//   @override
//   void initState() {
//     fetchData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.sizeOf(context);
//     return Scaffold(
//       body: Consumer<NewsDetailsController>(
//         builder: (context, controller, _) {
//           return controller.isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : Stack(
//                   children: [
//                     Container(
//                       height: size.height * .5,
//                       decoration: BoxDecoration(
//                         color: ColorConstants.grey,
//                        image: DecorationImage(
//   image: NetworkImage(controller.newsDetailsModel.data?.isNotEmpty == true
//       ? controller.newsDetailsModel.data!.first.featuredImage?.filePath ?? ""
//       : ""),
//   fit: BoxFit.cover,
// )

//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Container(
//                         height: size.height * .56,
//                         width: size.width,
//                         decoration: BoxDecoration(
//                           color: ColorConstants.white,
//                           borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(24),
//                               topRight: Radius.circular(24)),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                               left: 20, right: 20, top: 75),
//                           child: SingleChildScrollView(
//                             child: Text(
//   textAlign: TextAlign.justify,
//   controller.newsDetailsModel.data?.isNotEmpty == true
//       ? controller.newsDetailsModel.data!.first.shortDescription ?? "" // Use the field you want, like shortDescription
//       : "",
//   style: GLTextStyles.nunitoStyle(
//     size: 14,
//     color: ColorConstants.maroon,
//     weight: FontWeight.w600,
//   ),
// )

//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: size.height * .34,
//                       left: size.width * .1,
//                       child: Container(
//                         padding: const EdgeInsets.all(12),
//                         height: size.height * .20,
//                         width: size.width * .8,
//                         decoration: const BoxDecoration(
//                             color: Colors.white70,
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(16))),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                           Text(
//   DateFormat('dd/MM/yyyy')
//       .format(controller.newsDetailsModel.data?.isNotEmpty == true
//           ? controller.newsDetailsModel.data!.first.publishedOn ?? DateTime.now()
//           : DateTime.now())
//       .toString(),
//   style: GLTextStyles.nunitoStyle(
//     size: 12,
//     color: ColorConstants.maroon,
//     weight: FontWeight.w600,
//   ),
// )
// ,
//                             Text(
//                                 controller.newsDetailsModel.data?.data
//                                         ?.browserTitle ??
//                                     "",
//                                 style: GLTextStyles.loraStyle(
//                                     size: 18,
//                                     color: ColorConstants.maroon,
//                                     weight: FontWeight.w800)),
//                             // Text(
//                             //     controller.newsDetailsModel.data?.data
//                             //             ?.publishedBy ??
//                             //         "",
//                             //     style: GLTextStyles.nunitoStyle(
//                             //         size: 12,
//                             //         color: ColorConstants.maroon,
//                             //         weight: FontWeight.w600)),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 24,
//                       left: 20,
//                       child: Container(
//                         height: size.width * .1,
//                         width: size.width * .1,
//                         decoration: BoxDecoration(
//                             color: Colors.white70,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 4),
//                           child: IconButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             icon: const Icon(
//                               Icons.arrow_back_ios,
//                               size: 20,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//         },
//       ),
//       floatingActionButton: Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomCenter,
//               colors: [ColorConstants.red, ColorConstants.pink]),
//         ),
//         child: FloatingActionButton(
//           elevation: 0,
//           shape: const CircleBorder(),
//           onPressed: () {},
//           backgroundColor: Colors.transparent,
//           child: Icon(
//             Icons.favorite_border,
//             color: ColorConstants.white,
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//     );
//   }
// }
