import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tyba_test/domain/gateway/university_gateway.dart';
import 'package:tyba_test/domain/model/university.dart';
import 'package:http/http.dart' as http;

class UniversityApi implements UniversityGateway {
  UniversityApi(BuildContext context);

  @override
  Future<Either<String, List<University>>> getUniversities() async {
    final universitiesURL =
        "https://tyba-assets.s3.amazonaws.com/FE-Engineer-test/universities.json";
    List<University> universityList = [];
    try {
      final url = Uri.parse(universitiesURL);
      final response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      universityList = [
        for (var item in jsonDecode(response.body)) University.fromJson(item)
      ];

      return Right<String, List<University>>(universityList);
    } catch (_) {
      return Left<String, List<University>>('Error obteniendo universidades');
    }
  }
}
