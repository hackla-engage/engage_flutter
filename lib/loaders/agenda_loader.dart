import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../shared/agenda_entry.dart';
import '../shared/category_entry.dart';

class AgendaList{
  List<AgendaEntry> entries;

  List<AgendaEntry> _extractEntries(Map agendas) {
    List l = new List();
    agendas['items'].forEach((Map m){
      AgendaEntry entry = new AgendaEntry(m["id"], m["title"], 
          agendas["tag"], m["summary"], m["department"], 
          m["background"], m["supplemental"], m["sponsors"], m["agenda"] );
      l.add(entry);
    });
    return l;

  }
  Stream<List<AgendaEntry>> fetch(Set<CategoryEntry> categories) async * {
    const CATEGORY_URL = 'http://council-tag.herokuapp.com/api/tag/Learning/agenda/items?format=json';
    http.read(CATEGORY_URL).then((String text ) { yield _extractEntries(JSON.decode(text)); } );
    final List agendas = JSON.decode( await  );
  }

  String _make_url(String tagName) {
    const CATEGORY_URL = 'http://council-tag.herokuapp.com/api/tag/${tagName}/agenda/items?format=json';
    return CATEGORY_URL;
  }

  void _print_query_url(String url){
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