// To parse this JSON data, do
//
//     final music2 =music2FromJson(jsonString);

import 'dart:convert';

List<Music2> music2FromJson(String str) => List<Music2>.from(json.decode(str).map((x) => Music2.fromJson(x)));

String music2ToJson(List<Music2> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Music2 {
    Music2({
             required this.objectid,
        required this.musicid2,
        required this.musicName2,
        });
        String objectid;
    String musicid2;
    String musicName2;
    factory Music2.fromJson(Map<String, dynamic> json) => Music2(
            objectid:json["objectid"],
        musicid2:json["musicid2"],
        musicName2:json["musicName2"],
        );

    Map<String, dynamic> toJson() => {
            "objectid" : objectid,
        "musicid2" : musicid2,
        "musicName2" : musicName2,
        };
}
