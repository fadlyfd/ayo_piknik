import 'package:flutter_ayo_piknik/data/models/responses/event_response_model.dart';

class TicketResponseModel {
  final String? status;
  final List<TicketModel>? data;

  TicketResponseModel({
    this.status,
    this.data,
  });

  factory TicketResponseModel.fromJson(Map<String, dynamic> json) =>
      TicketResponseModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<TicketModel>.from(
                json["data"]!.map((x) => TicketModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
