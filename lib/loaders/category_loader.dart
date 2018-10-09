import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../shared/category_entry.dart';
import '../url/engage_backend.dart';



class CategoryList{

  List<CategoryEntry> entries;

  CategoryList(List tags){
    entries = _extractEntries(tags);
  }

  static List<CategoryEntry> _extractEntries(List tags){
    List<CategoryEntry> l = new List();
    tags.forEach( (m) =>
      l.add(new CategoryEntry(m["id"], m["name"], Icons.home, m["description"]))
    );
    return l;
  }
  
  static Future<CategoryList> fetch() async {
    const categoryURL = ENGAGE_BACKEND_API_URL + 'tags/';
    /* needs accept : application/json header 
    * https://github.com/hackla-engage/engage-backend/issues/127
    */
    const headers = {
      'accept': 'application/json'
    };
    print( "***** query $categoryURL ******" );
    final List tags = json.decode( await http.read(categoryURL, headers: headers) );
    return new CategoryList(tags);
  }
}
