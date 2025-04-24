import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_spider/repository/api/details_screen/model/details_screen_model.dart';
import 'package:news_spider/repository/api/details_screen/service/details_screen_service.dart';

class NewsDetailsController extends ChangeNotifier {
  bool isLoading = false;
  DetailsModel newsDetailsModel = DetailsModel();

  fetchData(slug) {
    isLoading = true;
    notifyListeners();
    NewsDetailsService.fetchData(slug).then((value) {
      if (value["status"] == 1) {
        newsDetailsModel = DetailsModel.fromJson(value);
        isLoading = false;
      } else {
        log("Api failed");
      }
      notifyListeners();
    });
  }
}
