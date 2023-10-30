import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pltable/api_integration/api.dart';

final plserviceprovider = Provider((ref) => PlService());

class PlService {
  final dio = Dio();
  Future<Either<String, List<PremierLeague>>> getdata() async {
    try {
      final response =
          await dio.get('https://premier-league-standings1.p.rapidapi.com/',
              options: Options(headers: {
                "X-RapidAPI-Key":
                    "2488c82492mshebb818e0d01b786p139d76jsnb77fff15b6b2",
                "X-RapidAPI-Host": "premier-league-standings1.p.rapidapi.com",
              }));
      final extractdata = (response.data as List)
          .map((e) => PremierLeague.fromJson(e))
          .toList();
      return Right(extractdata);
    } on DioException catch (err, _) {
      return Left(err.toString());
    }
  }
}
