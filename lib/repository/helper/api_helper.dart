import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:news_spider/app_config/app_config.dart';

class ApiHelper {
  static getData({
    required String endPoint,
    Map<String, String>? header,
  }) async {
    log("ApiHelper -> getData");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("url -> $url");
    try {
      var response = await http.get(url, headers: header);
      log("getData -> Status code -> ${response.statusCode}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var data = {"status": 1, "data": decodedData};
        return data;
      } else {
        log("Else Condition >> Api failed");
        var data = {"status": 0, "data": null};
        return data;
      }
    } catch (e) {
      log("$e");
    }
  }
}
