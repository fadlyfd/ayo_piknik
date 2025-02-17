import 'dart:async';

import 'package:flutter_ayo_piknik/data/datasources/event_remote_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ayo_piknik/data/models/requests/create_event_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_event_event.dart';
part 'edit_event_state.dart';
part 'edit_event_bloc.freezed.dart';

class EditEventBloc extends Bloc<EditEventEvent, EditEventState> {
  final EventRemoteDatasource datasource;

  EditEventBloc(this.datasource) : super(_Initial()) {
    on<_EditEvent>((event, emit) async {
      emit(_Loading());
      final result = await datasource.updateEvent(event.model, event.id);
      result.fold((l) {
        emit(_Error(l));
      }, (r) {
        emit(_Success(r));
      });
    });
  }
}
