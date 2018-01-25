import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../shared/category_entry.dart';




class CategoryList{

  List<CategoryEntry> entries;

  CategoryList(Map map){
    entries = _extractEntries(map);
  }

  static List<CategoryEntry> _extractEntries(Map map){
    List<CategoryEntry> l;
    map.forEach(

    )

    return l;
  }
  
  static Future<CategoryList> fetch() async {
    const CATEGORY_URL = 'https://council-tag.herokuapp.com/api/tags/?format=json';
    print( "***** query ${CATEGORY_URL} ******" );
    final Map map = JSON.decode( await http.read(CATEGORY_URL) );
    return new CategoryList(map);
  }
}