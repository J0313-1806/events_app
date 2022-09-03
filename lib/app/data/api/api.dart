import 'dart:developer';

import 'package:events_app/app/data/model/model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const String uri = "http://44.234.205.222/eventapp/api/home/data";

  static Future<Data> getData() async {
    try {
      Uri url = Uri.parse(uri);
      final response = await http.get(url, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      });

      if (response.statusCode == 200) {
        final eventData = eventModelFromJson(response.body);
        bool status = eventData.success;
        if (status) {
          final result = eventData.data;
          return result;
        } else {
          log(eventData.success.toString());
        }
      } else {
        log("wrong status code");
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }
}
