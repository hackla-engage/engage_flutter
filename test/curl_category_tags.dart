import 'package:test/test.dart';
import 'package:flutter/material.dart';

import 'package:engage_flutter/shared/category_entry.dart';
import 'package:engage_flutter/loaders/category_loader.dart';

void main() {
  test('curl tags', () async {
	  CategoryList tagList = await CategoryList.fetch();
	  var answer = 1;
    print(tagList.entries[0].id);
    expect(answer, tagList.entries[0].id);
  });
}