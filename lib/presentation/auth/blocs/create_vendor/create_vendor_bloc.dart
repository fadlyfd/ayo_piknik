import 'dart:async';

import 'package:flutter_ayo_piknik/data/datasources/vendor_remote_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ayo_piknik/data/models/requests/create_vendor_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_vendor_event.dart';
part 'create_vendor_state.dart';
part 'create_vendor_bloc.freezed.dart';

class CreateVendorBloc extends Bloc<CreateVendorEvent, CreateVendorState> {
  final VendorRemoteDataSource dataSource;

  CreateVendorBloc(this.dataSource) : super(const CreateVendorState.initial()) {
    on<_CreateVendor>((event, emit) async {
      emit(const CreateVendorState.loading());
      final result = await dataSource.createVendor(event.model);
      result.fold((failure) {
        emit(CreateVendorState.error(failure));
      }, (message) {
        emit(CreateVendorState.success(message));
      });
    });
  }
}
