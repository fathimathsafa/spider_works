import 'package:flutter/material.dart';
import 'package:news_spider/app_config/app_config.dart';
import 'package:news_spider/core/constants/colors.dart';
import 'package:news_spider/core/constants/text_styles.dart';
import 'package:news_spider/presentation/details_screen/view/details_screen.dart';
import 'package:news_spider/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:news_spider/presentation/home_screen/widget/news_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  fetchData(BuildContext context) {
    Provider.of<NewsController>(context, listen: false).fetchData();
  }

  @override
  void initState() {
    fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Latest News",
          style: GLTextStyles.loraStyle(
              color: ColorConstants.black,
              size: 20.sp,
              weight: FontWeight.w800),
        ),
        actions: [
          Text(
            "See All",
            style: GLTextStyles.nunitoStyle(
                color: ColorConstants.blue,
                size: 12.sp,
                weight: FontWeight.w600),
          ),
          SizedBox(width: 10.w),
          Icon(
            Icons.arrow_forward,
            color: ColorConstants.blue,
            size: 15.sp,
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: Consumer<NewsController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final newsList = controller.newsModel?.data ?? [];

          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            children: [
              //  Slider to display articles
              CarouselSlider(
                options: CarouselOptions(
                  height: 0.30.sh, // Using ScreenUtil for height
                  autoPlay: true,
                  padEnds: false,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.85,
                ),
                items: List.generate(3, (index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(
                        8.r), // Using ScreenUtil for border radius
                    child: Container(
                      width: 1.sw, // Using ScreenUtil for width
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            controller.newsModel?.data?[index].featuredImage
                                    ?.filePath ??
                                AppConfig.noImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                            15.w), // Using ScreenUtil for padding
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "by ${controller.newsModel?.data?[index].publishedBy?.name ?? "Unknown"}",
                              style: GLTextStyles.nunitoStyle(
                                size: 10.sp, // Responsive font size
                                weight: FontWeight.w700,
                                color: ColorConstants.white,
                              ),
                            ),
                            Text(
                              controller.newsModel?.data?[index].title ?? "",
                              style: GLTextStyles.loraStyle(
                                  size: 16.sp, // Responsive font size
                                  weight: FontWeight.w700,
                                  color: ColorConstants.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 15.h), // Using ScreenUtil for height
              // List of news articles
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final newsItem = newsList[index];
                  return InkWell(
                    // Navigate to News Detail Screen
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailsScreen(
                            slug: newsItem.slug ?? "",
                          ),
                        ),
                      );
                    },
                    child: NewsCard(
                      name: newsItem.title ?? "",
                      imageUrl:
                          newsItem.featuredImage?.filePath ?? AppConfig.noImage,
                      publishedBy: newsItem.publishedBy?.name ?? "",
                      publishedOn: newsItem.publishedOn ?? DateTime.now(),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const Divider(height: 10, thickness: 0.1),
                itemCount: newsList.length,
              ),
            ],
          );
        },
      ),
    );
  }
}
