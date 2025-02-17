import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_ayo_piknik/core/constants/variabels.dart';
import 'package:flutter_ayo_piknik/data/datasources/auth_local_datasource.dart';
import 'package:flutter_ayo_piknik/data/models/responses/event_category_response_model.dart';
import 'package:http/http.dart' as http;

class EventCategoryRemoteDatasource {
  Future<Either<String, EventCategoryResponseModel>>
      getEventCategories() async {
    final authData = await AuthLocalDatasource().getAuthData();

    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/event-categories'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData.data!.token!}',
      },
    );
    // log(response.statusCode.toString());
    // log(response.body);
    if (response.statusCode == 200) {
      return Right(
          EventCategoryResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Failed to get events');
    }
  }
}
