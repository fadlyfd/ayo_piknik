import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_ayo_piknik/core/constants/variabels.dart';
import 'package:flutter_ayo_piknik/data/datasources/auth_local_datasource.dart';
import 'package:http/http.dart' as http;

import '../models/responses/vendor_response_model.dart';

class VendorRemoteDataSource {
  Future<Either<String, VendorResponseModel>> getVendorsUser() async {
    final authData = await AuthLocalDatasource().getAuthData();

    final response = await http.get(
      Uri.parse(
          '${Variables.baseUrl}/api/vendors/user/${authData.data!.user!.id}'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData.data!.token!}',
      },
    );
    if (response.statusCode == 200) {
      return Right(VendorResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Failed to get vendors');
    }
  }
}
