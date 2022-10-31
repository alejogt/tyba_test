import 'package:tyba_test/domain/model/university.dart';

abstract class UniversityInterface {
  void setUniversities(List<University>? universityList);
  void showLoading();
  void hideLoading();
  void showAlert(String message);
}
