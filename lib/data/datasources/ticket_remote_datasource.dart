import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_ayo_piknik/core/constants/variabels.dart';
import 'package:flutter_ayo_piknik/data/datasources/auth_local_datasource.dart';
import 'package:flutter_ayo_piknik/data/models/responses/ticket_response_model.dart';
import 'package:http/http.dart' as http;

class TicketRemoteDatasource {
  Future<Either<String, TicketResponseModel>> getTicketsUser() async {
    final authData = await AuthLocalDatasource().getAuthData();

    final response = await http.get(
      Uri.parse(
          '${Variables.baseUrl}/api/tickets/user/${authData.data!.user!.id}'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData.data!.token!}',
      },
    );
    if (response.statusCode == 200) {
      return Right(TicketResponseModel.fromJson(json.decode(response.body)));
    } else {
      return const Left('Failed to get ticket');
    }
  }
}
