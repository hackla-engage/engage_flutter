import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../shared/category_entry.dart';




class CategoryList{

  List<CategoryEntry> entries;

  CategoryList(List tags){
    entries = _extractEntries(tags);
  }

  static List<CategoryEntry> _extractEntries(List tags){
    List<CategoryEntry> l = new List();
    tags.forEach( (Map m) =>
      l.add(new CategoryEntry(m["id"], m["name"], Icons.home, m["description"]))
    );
    return l;
  }
  
  static Future<CategoryList> fetch() async {
    const CATEGORY_URL = 'https://council-tag.herokuapp.com/api/tags/?format=json';
    print( "***** query ${CATEGORY_URL} ******" );
    final List tags = JSON.decode( await http.read(CATEGORY_URL) );
    return new CategoryList(tags);
  }
}
