import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'infrastructure/notifier/tyba_notifier.dart';
import 'ui/pages/home.dart';
import 'ui/routes/tyba_route.dart';

void main() async {
  final List<SingleChildWidget> providers = <SingleChildWidget>[
    ChangeNotifierProvider<TybaNotifier>(create: (_) => TybaNotifier()),
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

    return MaterialApp(
      title: 'Tyba App',
      theme: ThemeData.light(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: MyHomePage.routeName,
      routes: routes.getRoutes(),
    );
  }
}
