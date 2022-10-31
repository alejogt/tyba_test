import 'package:flutter/material.dart';
import 'package:tyba_test/config/university_config.dart';
import 'package:tyba_test/infrastructure/driven_adapter/repository/university_api.dart';
import 'package:tyba_test/ui/pages/home.dart';
import 'package:tyba_test/ui/pages/universities.dart';

class TybaRoute {
  Map<String, WidgetBuilder> getRoutes() {
    final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{}
      ..addAll(<String, WidgetBuilder>{
        TybaHomePage.routeName: (context) =>
            TybaHomePage(title: 'Tyba Frontend Engineer test'),
        Univerities.routeName: (context) =>
            Univerities(config: UniversityConfig(UniversityApi(context))),
      });
    return routes;
  }

  void navigator(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}
