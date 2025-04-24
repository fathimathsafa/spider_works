import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_spider/core/constants/colors.dart';
import 'package:news_spider/core/constants/text_styles.dart';
import 'package:news_spider/presentation/details_screen/controller/details_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({super.key, required this.slug});

  final String slug;

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  fetchData() {
    Provider.of<NewsDetailsController>(context, listen: false)
        .fetchData(widget.slug);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NewsDetailsController>(
        builder: (context, controller, _) {
          return controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    // Background Image
                    Container(
                      height: 0.5.sh, // Responsive height using ScreenUtil
                      decoration: BoxDecoration(
                        color: ColorConstants.grey,
                        image: DecorationImage(
                            image: NetworkImage(controller.newsDetailsModel.data
                                    ?.featuredImage?.filePath ??
                                ""),
                            fit: BoxFit.cover),
                      ),
                    ),

                    // Content Container
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 0.56.sh, // Responsive height
                        width: 1.sw, // Full width of the screen
                        decoration: BoxDecoration(
                          color: ColorConstants.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.r),
                              topRight: Radius.circular(24.r)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 20.w,
                              right: 20.w,
                              top: 75.h), // Responsive padding
                          child: SingleChildScrollView(
                            child: Text(
                              textAlign: TextAlign.justify,
                              controller.newsDetailsModel.data?.content ?? "",
                              style: GLTextStyles.nunitoStyle(
                                  size: 14.sp, // Responsive font size
                                  color: ColorConstants.maroon,
                                  weight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Title Card
                    Positioned(
                      top: 0.34.sh, // Responsive position
                      left: 0.1.sw, // Responsive position
                      child: Container(
                        padding: EdgeInsets.all(12.w), // Responsive padding
                        height: 0.20.sh, // Responsive height
                        width: 0.8.sw, // Responsive width
                        decoration: const BoxDecoration(
                            color: Colors.white70,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              child: Text(
                                  DateFormat('dd/MM/yyyy')
                                      .format(controller.newsDetailsModel.data
                                              ?.publishedOn ??
                                          DateTime.now())
                                      .toString(),
                                  style: GLTextStyles.nunitoStyle(
                                      size: 12.sp, // Responsive font size
                                      color: ColorConstants.maroon,
                                      weight: FontWeight.w600)),
                            ),
                            Flexible(
                              child: Text(
                                  controller.newsDetailsModel.data
                                          ?.browserTitle ??
                                      "",
                                  style: GLTextStyles.loraStyle(
                                      size: 18.sp, // Responsive font size
                                      color: ColorConstants.maroon,
                                      weight: FontWeight.w800)),
                            ),
                            Text(
                                "by ${controller.newsDetailsModel.data?.publishedBy?.name ?? "Unknown"}",
                                style: GLTextStyles.nunitoStyle(
                                    size: 12.sp, // Responsive font size
                                    color: ColorConstants.maroon,
                                    weight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),

                    // Back Button
                    Positioned(
                      top: 24.h, // Responsive position
                      left: 20.w, // Responsive position
                      child: Container(
                        height: 0.1.sw, // Responsive size
                        width: 0.1.sw, // Responsive size
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 4.w), // Responsive padding
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 20.sp, // Responsive icon size
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),

      // Floating Action Button (Like Button)
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [ColorConstants.red, ColorConstants.pink]),
        ),
        child: FloatingActionButton(
          elevation: 0,
          shape: const CircleBorder(),
          onPressed: () {},
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.favorite_border,
            color: ColorConstants.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
