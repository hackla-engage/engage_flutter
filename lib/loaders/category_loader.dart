import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import '../shared/category_entry.dart';

const CATEGORY_URL = 'https://council-tag.herokuapp.com/api/tags/?format=json';

