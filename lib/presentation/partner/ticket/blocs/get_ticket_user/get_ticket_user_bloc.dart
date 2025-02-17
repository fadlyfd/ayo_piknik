import 'package:flutter_ayo_piknik/data/datasources/ticket_remote_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ayo_piknik/data/models/responses/ticket_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_ticket_user_event.dart';
part 'get_ticket_user_state.dart';
part 'get_ticket_user_bloc.freezed.dart';

class GetTicketUserBloc extends Bloc<GetTicketUserEvent, GetTicketUserState> {
  final TicketRemoteDatasource datasource;

  GetTicketUserBloc(this.datasource) : super(const _Initial()) {
    on<_GetTicketUser>(
      (event, emit) async {
        emit(const _Loading());
        final result = await datasource.getTicketsUser();
        result.fold(
          (l) => emit(GetTicketUserState.error(l)),
          (r) => emit(GetTicketUserState.success(r)),
        );
      },
    );
  }
}
