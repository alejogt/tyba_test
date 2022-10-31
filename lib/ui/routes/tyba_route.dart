import 'package:flutter/material.dart';
import 'package:tyba_test/ui/pages/home.dart';

class TybaRoute {
  Map<String, WidgetBuilder> getRoutes() {
    final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{}
      ..addAll(<String, WidgetBuilder>{
        MyHomePage.routeName: (context) => MyHomePage(title: 'Tyba App'),
      });
    return routes;
  }

  void navigator(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}
