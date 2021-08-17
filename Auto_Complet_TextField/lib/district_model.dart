// To parse this JSON data, do
//
//     final districtModel = districtModelFromJson(jsonString);

import 'dart:convert';

class DistrictModel {
    DistrictModel({
        this.status,
        this.data,
    });

    final Status ?status;
    final List<Datum> ?data;

    factory DistrictModel.fromRawJson(String str) => DistrictModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status!.toJson(),
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.district,
        this.districtbn,
        this.coordinates,
    });

    final String? id;
    final String? district;
    final String? districtbn;
    final String? coordinates;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"] == null ? null : json["_id"],
        district: json["district"] == null ? null : json["district"],
        districtbn: json["districtbn"] == null ? null : json["districtbn"],
        coordinates: json["coordinates"] == null ? null : json["coordinates"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "district": district == null ? null : district,
        "districtbn": districtbn == null ? null : districtbn,
        "coordinates": coordinates == null ? null : coordinates,
    };
}

class Status {
    Status({
        this.code,
        this.message,
        this.date,
    });

    final int? code;
    final String? message;
    final String? date;

    factory Status.fromRawJson(String str) => Status.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        date: json["date"] == null ? null : json["date"],
    );

    Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "date": date == null ? null : date,
    };
}
