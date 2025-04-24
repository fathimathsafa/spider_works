import 'dart:developer';

import 'package:news_spider/repository/helper/api_helper.dart';


class NewsDetailsService {
  static Future<dynamic> fetchData(slug) async {
    try {
      var decodedData = ApiHelper.getData(endPoint: "blogs/$slug");
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
