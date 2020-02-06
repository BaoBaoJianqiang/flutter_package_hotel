import 'package:flutter/material.dart';
import 'package:flutter_package_hotel/page12.dart';
import 'package:flutter_package_hotel/page12_1.dart';

class RouteHotel {
  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      'page12': (BuildContext context) => new Page12(),
      'page12_1': (BuildContext context) => new Page12_1(),
    };
  }
}
