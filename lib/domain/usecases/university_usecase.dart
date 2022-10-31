import 'package:dartz/dartz.dart';
import 'package:tyba_test/domain/gateway/university_gateway.dart';
import 'package:tyba_test/domain/model/university.dart';

class UniversityUsecase {
  final UniversityGateway? universityGateway;

  UniversityUsecase({required this.universityGateway});

  Future<Either<String, List<University>>> getUniversities() {
    return universityGateway!.getUniversities();
  }
}
