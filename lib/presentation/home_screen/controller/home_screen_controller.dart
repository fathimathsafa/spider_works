import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:news_spider/repository/api/home_screen/model/home_screen_model.dart';
import 'package:news_spider/repository/api/home_screen/service/home_screen_service.dart';


class NewsController extends ChangeNotifier {
  bool isLoading = false;
  NewsModel? newsModel;

  fetchData() async {
    isLoading = true;
    notifyListeners();
    log("NewsController -> fetchData()");

    try {
      final value = await NewsService.fetchNews();
      if (value["status"] == 1) {
        newsModel = NewsModel.fromJson(value["data"]);
      } else {
        log("Error fetching news");
      }
    } catch (e) {
      log("Fetch error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
