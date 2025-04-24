import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:news_spider/repository/api/details_screen/model/details_screen_model.dart';
import 'package:news_spider/repository/api/details_screen/service/details_screen_service.dart';

class NewsDetailsController extends ChangeNotifier {
  bool isLoading = false;
  DetailsModel newsDetailsModel = DetailsModel();

  Future<void> fetchData(String slug) async {
    try {
      isLoading = true;
      notifyListeners();
      log("NewsDetailsController -> fetchData()");

      final value = await NewsDetailsService.fetchNewsDetails(slug);

      if (value["status"] == 1) {
        newsDetailsModel = DetailsModel.fromJson(value["data"]);
      } else {
        log("Error fetching news details data");
      }
    } catch (e) {
      log("fetchData error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
