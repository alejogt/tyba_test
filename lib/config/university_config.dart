import 'package:tyba_test/domain/gateway/university_gateway.dart';
import 'package:tyba_test/domain/usecases/university_usecase.dart';

class UniversityConfig {
  late UniversityUsecase universityUseCase;

  UniversityConfig(UniversityGateway _gateway) {
    universityUseCase = UniversityUsecase(universityGateway: _gateway);
  }
}
