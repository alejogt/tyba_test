import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';
import 'package:tyba_test/config/university_config.dart';
import 'package:tyba_test/domain/model/university.dart';
import 'package:tyba_test/ui/interfaces/university_interface.dart';
import 'package:tyba_test/ui/presenter/university_presenter.dart';

class Univerities extends StatefulWidget {
  static const routeName = '/universities';
  List<University> _universityList = [];
  Icon viewTypeIcon = Icon(Icons.grid_3x3);
  String viewType = "";
  final UniversityConfig config;

  Univerities({Key? key, required this.config}) : super(key: key);

  @override
  State<Univerities> createState() => _UniveritiesState();
}

class _UniveritiesState extends State<Univerities>
    implements UniversityInterface {
  late UniversityPresenter _presenter;

  void initState() {
    _presenter = UniversityPresenter(widget.config, this);
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
        (_) async => {await _presenter.getUniversities()});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Universities'),
          actions: <Widget>[
            IconButton(
              icon: widget.viewTypeIcon,
              onPressed: () {
                setState(() {
                  switch (widget.viewType) {
                    case "List":
                      widget.viewType = "Grid";
                      widget.viewTypeIcon = Icon(Icons.list);
                      break;
                    case "Grid":
                      widget.viewType = "List";
                      widget.viewTypeIcon = Icon(Icons.grid_3x3);
                      break;
                    default:
                      widget.viewType = "List";
                      widget.viewTypeIcon = Icon(Icons.grid_3x3);
                  }
                });
              },
            ),
          ],
        ),
        body: getUniversities());
  }

  Widget getUniversities() {
    switch (widget.viewType) {
      case "List":
        return ListView(
          padding: const EdgeInsets.all(10),
          children: getUniversitiesList(),
        );
      case "Grid":
        return GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: getUniversitiesList());
      default:
        return ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            Container(
              height: 50,
              color: Color.fromRGBO(248, 122, 37, 1),
              child: const Center(child: Text('Universidad')),
            )
          ],
        );
    }
  }

  List<Widget> getUniversitiesList() {
    return <Widget>[
      for (var university in widget._universityList)
        Container(
          height: 50,
          color: Color.fromRGBO(43, 251, 187, 1),
          child: Column(children: [
            Center(child: Text(university.name!)),
            Center(child: Text(university.country!))
          ]),
        )
    ];
  }

  @override
  void hideLoading() {
    Navigator.pop(context);
  }

  @override
  void setUniversities(List<University>? universityList) {
    setState(() {
      widget._universityList = universityList!;
      widget.viewType = "List";
    });
  }

  @override
  void showAlert(String message) {
    AlertDialog alert = AlertDialog(
      title: Text("Tyba"),
      content: Text(message),
      actions: [
        TextButton(onPressed: () {}, child: Text("OK")),
      ],
    );
  }

  @override
  void showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircularProgressIndicator(color: Color.fromRGBO(248, 122, 37, 1)),
              const SizedBox(width: 10),
              Text("Cargando"),
              const SizedBox(height: 150),
            ],
          ),
        );
      },
    );
  }
}
