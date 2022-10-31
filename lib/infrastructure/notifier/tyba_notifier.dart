import 'package:flutter/foundation.dart';

class TybaNotifier with ChangeNotifier {
  Map<String, dynamic> _dataStructure = {};

  void setDataStructure(Map<String, dynamic> _MapIn) {
    _dataStructure = {
      'field1': _MapIn['field'],
    };
    notifyListeners();
  }

  String? getDataStructure(String key) {
    return _dataStructure[key];
  }

  //Metodos
  void deleteDataStructure() {
    _dataStructure = {};
  }
}
