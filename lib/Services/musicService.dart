import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/music.dart';

class Servicemusic{
      static Future<List<Music>?> fetchMusic() async {
          try{
            const url = "http://10.0.2.2:8000/musicstore/api/FindallMusic";
            final uri = Uri.parse(url);


            final response = await http.get(uri);
            final body = response.body;
            final json = jsonDecode(body);
            final music = musicFromJson(response.body);
            return music;
            
          }catch(e){
            print(e);
            return null;
          }

    }
    static Future<dynamic> postMusic(Music music) async {
      try{
        const url = "http://10.0.2.2:8000/musicstore/api/CreateMusic";
        final uri = Uri.parse(url);
        Map data = {
           "objectid" : music.objectid,
          "musicid" :  music.musicid,
        "musicName" :  music.musicName,
        };
        var response = await http.post(uri,body:json.encode(data),headers: {"Content-Type": "application/json"});
 
        return response.body;
      }catch(e){
        print(e);      }
    }
    static Future<dynamic> updateMusic(Music music) async {
      try{
        var url = "http://10.0.2.2:8000/musicstore/api/UpdateMusic";
        final uri = Uri.parse(url);
        Map data = {
          "objectid" : music.objectid,
          "musicid" :  music.musicid,
        "musicName" :  music.musicName,
        };
        var response = await http.put(uri,body:json.encode(data),headers: {"Content-Type": "application/json"});
        
        return response.body;
      }catch(e){
        print(e);
      }
      
    }
    static Future<dynamic> deleteMusic(String objectid) async {
      try{
        var url = "http://10.0.2.2:8000/musicstore/api/DeleteMusic?objectid=" + objectid;
        final uri = Uri.parse(url);
     
        var response = await http.delete(uri);
        
        return response.body;
      }catch(e){
        print(e);
      }
        
    }
}