import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_spider/core/constants/colors.dart';
import 'package:news_spider/core/constants/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.name,
    required this.publishedBy,
    required this.publishedOn,
    required this.imageUrl,
  });

  final String name;
  final String publishedBy;
  final DateTime publishedOn;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Container(
        height: size.height * .22, 
        decoration: BoxDecoration(
          color: ColorConstants.grey,
          borderRadius: BorderRadius.circular(8.r), 
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.w), 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: GLTextStyles.loraStyle(
                      size: 16.sp,
                      color: ColorConstants.white,
                      weight: FontWeight.w700),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      publishedBy,
                      style: GLTextStyles.nunitoStyle(
                          size: 12.sp, 
                          color: ColorConstants.white,
                          weight: FontWeight.w600),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      DateFormat('dd/MM/yyyy').format(publishedOn).toString(),
                      style: GLTextStyles.nunitoStyle(
                          size: 12.sp, 
                          color: ColorConstants.white,
                          weight: FontWeight.w600),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
