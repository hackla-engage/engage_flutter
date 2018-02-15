import 'package:test/test.dart';
import 'package:flutter/material.dart';

import 'package:engage_flutter/shared/agenda_entry.dart';
import 'package:engage_flutter/loaders/agenda_loader.dart';

import 'package:engage_flutter/shared/category_entry.dart';
import 'package:engage_flutter/loaders/category_loader.dart';

import 'dart:core';
import 'dart:async';

void main() {
  test('curl agendas', () async {
    CategoryList tagList = await CategoryList.fetch();
    Set<CategoryEntry> tag = new Set();
    //print(tagList.entries[0].title);
    tag.add(tagList.entries[0]);
	  var stream = AgendaList.fetch(tag);
    var l = new List();
    await for (var a in stream){
      l.add(a);
      //print(a.id);
    }
	  var answer = 3;
    expect(answer, l[0].id);
  });
}