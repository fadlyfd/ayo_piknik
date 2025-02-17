
import 'package:flutter_ayo_piknik/data/datasources/order_remote_datasource.dart';
import 'package:flutter_ayo_piknik/data/models/responses/create_order_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ayo_piknik/data/models/requests/create_order_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_order_event.dart';
part 'create_order_state.dart';
part 'create_order_bloc.freezed.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  final OrderRemoteDatasource datasource;
  CreateOrderBloc(this.datasource) : super(const _Initial()) {
    on<_Create>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.createOrder(event.model);
      result.fold((l) => emit(_Error(l)), (r) {
        emit(_Success(r));
      });
    });
  }
}
