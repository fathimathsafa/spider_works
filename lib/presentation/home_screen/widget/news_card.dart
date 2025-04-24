import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_spider/core/constants/colors.dart';
import 'package:news_spider/core/constants/text_styles.dart';

// refactored here to call in home screen to display news articles
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
          borderRadius: BorderRadius.circular(8),
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: GLTextStyles.loraStyle(
                    size: 16,
                    color: ColorConstants.white,
                    weight: FontWeight.w700),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    publishedBy,
                    style: GLTextStyles.nunitoStyle(
                        size: 12,
                        color: ColorConstants.white,
                        weight: FontWeight.w600),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(publishedOn).toString(),
                    style: GLTextStyles.nunitoStyle(
                        size: 12,
                        color: ColorConstants.white,
                        weight: FontWeight.w600),
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
