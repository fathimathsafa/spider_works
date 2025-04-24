import 'dart:developer';

import '../../../helper/api_helper.dart';

class NewsService {
  static Future<dynamic> fetchNews() async {
    try {
      var decodedData = await ApiHelper.getData(endPoint: "blogs");
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
