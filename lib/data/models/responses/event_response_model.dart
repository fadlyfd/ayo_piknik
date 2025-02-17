import 'package:flutter_ayo_piknik/data/models/responses/event_category_response_model.dart';

class EventResponseModel {
  final String? status;
  final List<EventModel>? data;

  EventResponseModel({
    this.status,
    this.data,
  });

  factory EventResponseModel.fromJson(Map<String, dynamic> json) =>
      EventResponseModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<EventModel>.from(
                json["data"]!.map((x) => EventModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class EventModel {
  final int? id;
  final int? vendorId;
  final int? eventCategoryId;
  final String? name;
  final String? description;
  final String? image;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Vendor? vendor;
  final EventCategoryModel? eventCategory;
  final List<TicketModel>? tickets;

  EventModel({
    this.id,
    this.vendorId,
    this.eventCategoryId,
    this.name,
    this.description,
    this.image,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
    this.vendor,
    this.eventCategory,
    this.tickets,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        vendorId: json["vendor_id"],
        eventCategoryId: json["event_category_id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
        eventCategory: json["event_category"] == null
            ? null
            : EventCategoryModel.fromJson(json["event_category"]),
        tickets: json["tickets"] == null
            ? []
            : List<TicketModel>.from(
                json["tickets"]!.map((x) => TicketModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "event_category_id": eventCategoryId,
        "name": name,
        "description": description,
        "image": image,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "vendor": vendor?.toJson(),
        "category": eventCategory?.toJson(),
        "tickets": tickets == null
            ? []
            : List<dynamic>.from(tickets!.map((x) => x.toJson())),
      };
}

class Category {
  final int? id;
  final String? name;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Category({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Vendor {
  final int? id;
  final int? userId;
  final String? name;
  final String? location;
  final String? phone;
  final String? email;
  final String? city;
  final String? description;
  final String? verifyStatus;

  Vendor({
    this.id,
    this.userId,
    this.name,
    this.location,
    this.phone,
    this.email,
    this.city,
    this.description,
    this.verifyStatus,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        location: json["location"],
        phone: json["phone"],
        email: json["email"],
        city: json["city"],
        description: json["description"],
        verifyStatus: json["verify_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "location": location,
        "phone": phone,
        "email": email,
        "city": city,
        "description": description,
        "verify_status": verifyStatus,
      };
}

class SkuModel {
  final int? id;
  final String? name;
  final String? category;
  final int? eventId;
  final String? price;
  final int? stock;
  final String? dayType;

  SkuModel({
    this.id,
    this.name,
    this.category,
    this.eventId,
    this.price,
    this.stock,
    this.dayType,
  });

  factory SkuModel.fromJson(Map<String, dynamic> json) => SkuModel(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        eventId: json["event_id"],
        price: json["price"],
        stock: json["stock"],
        dayType: json["day_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "event_id": eventId,
        "price": price,
        "stock": stock,
        "day_type": dayType,
      };
}

class TicketModel {
  final int? id;
  final int? skuId;
  final int? eventId;
  final String? ticketCode;
  final DateTime? ticketDate;
  final String? status;
  final SkuModel? sku;
  final EventModel? event;
  TicketModel({
    this.id,
    this.skuId,
    this.eventId,
    this.ticketCode,
    this.ticketDate,
    this.status,
    this.sku,
    this.event,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        id: json["id"],
        skuId: json["sku_id"],
        eventId: json["event_id"],
        ticketCode: json["ticket_code"],
        ticketDate: json["ticket_date"] == null
            ? null
            : DateTime.parse(json["ticket_date"]),
        status: json["status"],
        sku: json["sku"] == null ? null : SkuModel.fromJson(json["sku"]),
        event:
            json["event"] == null ? null : EventModel.fromJson(json["event"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sku_id": skuId,
        "event_id": eventId,
        "ticket_code": ticketCode,
        "ticket_date":
            "${ticketDate!.year.toString().padLeft(4, '0')}-${ticketDate!.month.toString().padLeft(2, '0')}-${ticketDate!.day.toString().padLeft(2, '0')}",
        "status": status,
        "sku": sku?.toJson(),
        "event": event?.toJson(),
      };
}
