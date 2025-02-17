class CreateOrderResponseModel {
  final String? status;
  final String? message;
  final CreateOrderModel? data;

  CreateOrderResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory CreateOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateOrderResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : CreateOrderModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class CreateOrderModel {
  final int? userId;
  final int? eventId;
  final int? quantity;
  final int? total;
  final DateTime? eventDate;
  final String? status;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  CreateOrderModel({
    this.userId,
    this.eventId,
    this.quantity,
    this.total,
    this.eventDate,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory CreateOrderModel.fromJson(Map<String, dynamic> json) =>
      CreateOrderModel(
        userId: json["user_id"],
        eventId: json["event_id"],
        quantity: json["quantity"],
        total: json["total"],
        eventDate: json["event_date"] == null
            ? null
            : DateTime.parse(json["event_date"]),
        status: json["status"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "event_id": eventId,
        "quantity": quantity,
        "total": total,
        "event_date":
            "${eventDate!.year.toString().padLeft(4, '0')}-${eventDate!.month.toString().padLeft(2, '0')}-${eventDate!.day.toString().padLeft(2, '0')}",
        "status": status,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
