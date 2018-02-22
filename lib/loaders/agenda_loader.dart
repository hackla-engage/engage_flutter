import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../shared/agenda_entry.dart';
import '../shared/category_entry.dart';

class AgendaList{
  List<AgendaEntry> entries;
  String tagName;

  List<AgendaEntry> _extractEntries(Map agendas) {
    List l = new List();
    agendas['items'].forEach((Map m){
      AgendaEntry entry = new AgendaEntry(m["id"], Icons.home, m["title"], m["summary"], m["department"], 
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
      var agendas = JSON.decode(response);
      var l = agendas['items'];
      for( int i = 0; i < l.length; i++){
          var m = l[i];
          yield new AgendaEntry(m["id"], iter.current.icon, m["title"], m["summary"], m["department"], 
              m["background"], m["supplemental"], m["sponsors"], m["agenda"] );
      }
    
    }
  }

  static String _makeUrl(String tagName) {
    var CATEGORY_URL = 'http://council-tag.herokuapp.com/api/tag/${tagName}/agenda/items?format=json';
    return CATEGORY_URL;
  }

  static void printQuery(String url){
    print( "***** query ${url} ******" );
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