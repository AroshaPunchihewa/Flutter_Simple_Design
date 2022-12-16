import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/music2.dart';

class Servicemusic2{
      static Future<List<Music2>?> fetchMusic2() async {
          try{
            const url = "http://10.0.2.2:8000/musicstore/api/FindallMusic2";
            final uri = Uri.parse(url);


            final response = await http.get(uri);
            final body = response.body;
            final json = jsonDecode(body);
            final music2 = music2FromJson(response.body);
            return music2;
            
          }catch(e){
            print(e);
            return null;
          }

    }
    static Future<dynamic> postMusic2(Music2 music2) async {
      try{
        const url = "http://10.0.2.2:8000/musicstore/api/CreateMusic2";
        final uri = Uri.parse(url);
        Map data = {
           "objectid" : music2.objectid,
          "musicid2" :  music2.musicid2,
        "musicName2" :  music2.musicName2,
        };
        var response = await http.post(uri,body:json.encode(data),headers: {"Content-Type": "application/json"});
 
        return response.body;
      }catch(e){
        print(e);      }
    }
    static Future<dynamic> updateMusic2(Music2 music2) async {
      try{
        var url = "http://10.0.2.2:8000/musicstore/api/UpdateMusic2";
        final uri = Uri.parse(url);
        Map data = {
          "objectid" : music2.objectid,
          "musicid2" :  music2.musicid2,
        "musicName2" :  music2.musicName2,
        };
        var response = await http.put(uri,body:json.encode(data),headers: {"Content-Type": "application/json"});
        
        return response.body;
      }catch(e){
        print(e);
      }
      
    }
    static Future<dynamic> deleteMusic2(String objectid) async {
      try{
        var url = "http://10.0.2.2:8000/musicstore/api/DeleteMusic2?objectid=" + objectid;
        final uri = Uri.parse(url);
     
        var response = await http.delete(uri);
        
        return response.body;
      }catch(e){
        print(e);
      }
        
    }
}