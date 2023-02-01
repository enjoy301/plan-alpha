import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mybiseo_app/data/remote_datasource.dart';

class AllProvider extends ChangeNotifier {
  List<dynamic> calendar = [];
  bool didMake = false;
  Future<dynamic>? makeCalendar(DateTime dateTime) async {
    dynamic response = await RemoteDatasource().makeCalendar(dateTime);
    calendar = (jsonDecode(response['content'])['schedule']);
    print(calendar);
  }
}
