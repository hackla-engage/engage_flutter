import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../shared/agenda_entry.dart';

class AgendaList{
  List<AgendaEntry> entries;

  Stream<AgendaEntry> _extractEntries(Map agendas) async* {
    agendas['items'].forEach((Map m){
      AgendaEntry entry = new AgendaEntry(m["id"], m["title"], 
          agendas["tag"], m["summary"], m["department"], 
          m["background"], m["supplemental"], m["sponsors"], m["agenda"] );
      yield entry;
    });
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