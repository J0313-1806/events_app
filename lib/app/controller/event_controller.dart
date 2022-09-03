// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:events_app/app/data/api/api.dart';
import 'package:events_app/app/data/model/model.dart';
import 'package:events_app/app/screens/home.dart';
import 'package:flutter/cupertino.dart';

class EventProvider extends ChangeNotifier {
  EventProvider() {
    getData();
  }

  int selectedPage = 0;
  List<Widget> page = [
    const Home(),
  ];

  onItemTapped(int index) {
    selectedPage = index;
    notifyListeners();
  }

  List<Advertisment> advert = [];
  List<Package> package = [];
  List<Section> section = [];
  bool loader = false;

  void getData() async {
    try {
      loader = true;

      final data = await Api.getData();
      if (data != null) {
        advert.clear();
        package.clear();
        section.clear();
        if (data.advertisments.isNotEmpty) {
          advert.addAll(data.advertisments);
        }
        if (data.packages.isNotEmpty) {
          package.addAll(data.packages);
        }
        if (data.sections.isNotEmpty) {
          section.addAll(data.sections);
        }
      }
    } catch (e) {
      log(e.toString());
    } finally {
      loader = false;
      notifyListeners();
    }
  }
}
