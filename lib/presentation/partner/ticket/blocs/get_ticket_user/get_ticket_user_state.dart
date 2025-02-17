part of 'get_ticket_user_bloc.dart';

@freezed
class GetTicketUserState with _$GetTicketUserState {
  const factory GetTicketUserState.initial() = _Initial;
  const factory GetTicketUserState.loading() = _Loading;
  const factory GetTicketUserState.success(TicketResponseModel data) = _Success;
  const factory GetTicketUserState.error(String message) = _Error;
}
