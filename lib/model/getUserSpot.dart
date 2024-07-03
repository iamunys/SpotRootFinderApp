// To parse this JSON data, do
//
//     final spot = spotFromJson(jsonString);

import 'dart:convert';

List<Spot> spotFromJson(String str) => List<Spot>.from(json.decode(str).map((x) => Spot.fromJson(x)));

String spotToJson(List<Spot> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Spot {
    String? id;
    String? finderId;
    String? imageId;
    String? currentLocation;
    String? landMark;
    String? spotName;
    String? spotDescription;
    List<String>? spotType;
    String? isHaveEntryTime;
    String? entryTimeDetails;
    String? isOpenAllDay;
    String? entryOpenDaysDetails;
    String? isHaveAnyCost;
    String? costDetails;
    String? isFamilyFriendly;
    String? isFoodHold;
    String? whatHave;
    String? visitAgain;
    String? visitAgainDetails;
    List<String>? bestMonths;
    List<String>? bestTime;
    String? moreAbout;
    DateTime? addedDate;
    List<String>? spotImg;
    bool? adminApproved;
    int? v;

    Spot({
        this.id,
        this.finderId,
        this.imageId,
        this.currentLocation,
        this.landMark,
        this.spotName,
        this.spotDescription,
        this.spotType,
        this.isHaveEntryTime,
        this.entryTimeDetails,
        this.isOpenAllDay,
        this.entryOpenDaysDetails,
        this.isHaveAnyCost,
        this.costDetails,
        this.isFamilyFriendly,
        this.isFoodHold,
        this.whatHave,
        this.visitAgain,
        this.visitAgainDetails,
        this.bestMonths,
        this.bestTime,
        this.moreAbout,
        this.addedDate,
        this.spotImg,
        this.adminApproved,
        this.v,
    });

    factory Spot.fromJson(Map<String, dynamic> json) => Spot(
        id: json["_id"],
        finderId: json["finderId"],
        imageId: json["imageId"],
        currentLocation: json["currentLocation"],
        landMark: json["landMark"],
        spotName: json["spotName"],
        spotDescription: json["spotDescription"],
        spotType: json["spotType"] == null ? [] : List<String>.from(json["spotType"]!.map((x) => x)),
        isHaveEntryTime: json["isHaveEntryTime"],
        entryTimeDetails: json["entryTimeDetails"],
        isOpenAllDay: json["isOpenAllDay"],
        entryOpenDaysDetails: json["entryOpenDaysDetails"],
        isHaveAnyCost: json["isHaveAnyCost"],
        costDetails: json["costDetails"],
        isFamilyFriendly: json["isFamilyFriendly"],
        isFoodHold: json["isFoodHold"],
        whatHave: json["whatHave"],
        visitAgain: json["visitAgain"],
        visitAgainDetails: json["visitAgainDetails"],
        bestMonths: json["bestMonths"] == null ? [] : List<String>.from(json["bestMonths"]!.map((x) => x)),
        bestTime: json["bestTime"] == null ? [] : List<String>.from(json["bestTime"]!.map((x) => x)),
        moreAbout: json["moreAbout"],
        addedDate: json["addedDate"] == null ? null : DateTime.parse(json["addedDate"]),
        spotImg: json["spotImg"] == null ? [] : List<String>.from(json["spotImg"]!.map((x) => x)),
        adminApproved: json["adminApproved"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "finderId": finderId,
        "imageId": imageId,
        "currentLocation": currentLocation,
        "landMark": landMark,
        "spotName": spotName,
        "spotDescription": spotDescription,
        "spotType": spotType == null ? [] : List<String>.from(spotType!.map((x) => x)),
        "isHaveEntryTime": isHaveEntryTime,
        "entryTimeDetails": entryTimeDetails,
        "isOpenAllDay": isOpenAllDay,
        "entryOpenDaysDetails": entryOpenDaysDetails,
        "isHaveAnyCost": isHaveAnyCost,
        "costDetails": costDetails,
        "isFamilyFriendly": isFamilyFriendly,
        "isFoodHold": isFoodHold,
        "whatHave": whatHave,
        "visitAgain": visitAgain,
        "visitAgainDetails": visitAgainDetails,
        "bestMonths": bestMonths == null ? [] : List<String>.from(bestMonths!.map((x) => x)),
        "bestTime": bestTime == null ? [] : List<String>.from(bestTime!.map((x) => x)),
        "moreAbout": moreAbout,
        "addedDate": addedDate?.toIso8601String(),
        "spotImg": spotImg == null ? [] : List<String>.from(spotImg!.map((x) => x)),
        "adminApproved": adminApproved,
        "__v": v,
    };
}
