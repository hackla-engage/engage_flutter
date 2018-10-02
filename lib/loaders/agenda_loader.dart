import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../shared/agenda_entry.dart';
import '../shared/category_entry.dart';

import '../url/engage_backend.dart';

class AgendaList{
  List<AgendaEntry> entries;
  String tagName;

  List<AgendaEntry> _extractEntries(Map agendas) {
    List l = new List();
    agendas['items'].forEach((Map m){
      AgendaEntry entry = new AgendaEntry(m["id"], Icons.home, new DateTime.fromMillisecondsSinceEpoch(m["meeting_time"] * 1000),
          m["title"], m["summary"], "", m["recommendations"]["recommendation"], m["department"], 
          m["background"], m["supplemental"], m["sponsors"], m["agenda"] );
      l.add(entry);
    });
    return l;

  }
  static Stream<AgendaEntry> fetch(Set<CategoryEntry> categories) async* {
    var iter = categories.iterator;
    while(iter.moveNext()){
      var url = _makeUrl(iter.current.title);
      printQuery(url);
      String response = await http.read(url);
      var agendas = json.decode(response);
      var l = agendas['items'];
      for( int i = 0; i < l.length; i++){
          var m = l[i];
          String body = "";
          if (m["body"] is List) {
            List b = m["body"];
            body = b.join("\n");
          }
          String recommendation = " ";
          if(m["recommendations"] is List){
            List r = m["recommendations"];
            if(r.length > 0 ){
              Map a = r[0];
              recommendation = a["recommendation"];
            }
          }
          yield new AgendaEntry(m["id"], iter.current.icon, new DateTime.fromMillisecondsSinceEpoch(m["meeting_time"] * 1000), 
            m["title"],  m["summary"], recommendation, m["department"], m["background"], 
            m["supplemental"], m["sponsors"], m["agenda"], body );
      }
    
    }
  }

  static String _makeUrl(String tagName) {
    String categoryURL = ENGAGE_BACKEND_API_URL + 'tag/$tagName/agenda/items?format=json';
    return categoryURL;
  }

  static void printQuery(String url){
    print( "***** query $url ******" );
  }
  

}
//http://council-tag.herokuapp.com/api/tag/Learning/agenda/items

/*
{
            "id": 1,
            "recommendations": [],
            "title": "City Manager's Report: Tis the Season to Buy Local - A Report on Initiatives of the Buy Local SM Committee",
            "department": "2: Special Agenda Items",
            "summary": null,
            "background": null,
            "supplemental": null,
            "sponsors": null,
            "agenda": 1,
            "tags": [
                2,
                13
            ]
        }
*/