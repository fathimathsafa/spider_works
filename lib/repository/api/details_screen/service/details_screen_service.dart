import 'dart:developer';

import '../../../helper/api_helper.dart';

class NewsDetailsService {
  static Future<dynamic> fetchNewsDetails(String slug) async {
    try {
      var decodedData = await ApiHelper.getData(endPoint: "blogs/$slug");
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}