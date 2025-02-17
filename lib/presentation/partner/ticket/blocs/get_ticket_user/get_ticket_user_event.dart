part of 'get_ticket_user_bloc.dart';

@freezed
class GetTicketUserEvent with _$GetTicketUserEvent {
  const factory GetTicketUserEvent.started() = _Started;
  const factory GetTicketUserEvent.getTicketUser() = _GetTicketUser;
}
