import 'package:dartz/dartz.dart';
import 'package:tyba_test/config/university_config.dart';
import 'package:tyba_test/domain/model/university.dart';
import 'package:tyba_test/ui/interfaces/university_interface.dart';

class UniversityPresenter {
  final UniversityConfig _config;
  final UniversityInterface _interface;

  UniversityPresenter(this._config, this._interface);
  Future getUniversities() async {
    _interface.showLoading();
    Either<String, List<University>> response =
        await _config.universityUseCase.getUniversities();
    response.fold(
      (String error) => {
        _interface.hideLoading(),
        _interface.showAlert("Error al consultar Universidades")
      },
      (List<University> universityList) => {
        _interface.setUniversities(universityList),
        _interface.hideLoading()
      },
    );
  }
}
