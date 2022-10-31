import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'infrastructure/notifier/tyba_notifier.dart';
import 'ui/pages/home.dart';
import 'ui/routes/tyba_route.dart';
import 'ui/theme/theme_notifier.dart';

void main() async {
  final List<SingleChildWidget> providers = <SingleChildWidget>[
    ChangeNotifierProvider<TybaNotifier>(create: (_) => TybaNotifier()),
    ChangeNotifierProvider<TybaThemeNotifier>(
        create: (_) => TybaThemeNotifier())
  ];

  runApp(MultiProvider(
    providers: providers,
    child: TybaApp(),
  ));
}

class TybaApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TybaAppState();
}

class _TybaAppState extends State<TybaApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TybaRoute routes = TybaRoute();
    final TybaThemeNotifier appTheme = Provider.of<TybaThemeNotifier>(context);

    return MaterialApp(
      title: 'Tyba App',
      theme: ThemeData.light().copyWith(
          primaryColor: Color.fromRGBO(28, 151, 130, 1),
          backgroundColor: Color.fromRGBO(0, 115, 95, 1)),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark().copyWith(
          primaryColor: Color.fromRGBO(28, 151, 130, 1),
          backgroundColor: Color.fromRGBO(0, 115, 95, 1)),
      debugShowCheckedModeBanner: false,
      initialRoute: TybaHomePage.routeName,
      routes: routes.getRoutes(),
    );
  }
}
