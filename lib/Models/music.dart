// To parse this JSON data, do
//
//     final music =musicFromJson(jsonString);

import 'dart:convert';

List<Music> musicFromJson(String str) => List<Music>.from(json.decode(str).map((x) => Music.fromJson(x)));

String musicToJson(List<Music> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Music {
    Music({
             required this.objectid,
        required this.musicid,
        required this.musicName,
        });
        String objectid;
    String musicid;
    String musicName;
    factory Music.fromJson(Map<String, dynamic> json) => Music(
            objectid:json["objectid"],
        musicid:json["musicid"],
        musicName:json["musicName"],
        );

    Map<String, dynamic> toJson() => {
            "objectid" : objectid,
        "musicid" : musicid,
        "musicName" : musicName,
        };
}
