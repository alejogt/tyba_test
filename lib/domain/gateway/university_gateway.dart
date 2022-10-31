import 'package:tyba_test/domain/model/university.dart';
import 'package:dartz/dartz.dart';

abstract class UniversityGateway {
  Future<Either<String, List<University>>> getUniversities();
}
