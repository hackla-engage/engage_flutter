import 'dart:core';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../shared/agenda_entry.dart';
import '../shared/user.dart';

class AgendaMessenger {
    static const String MESSAGE_URL = 'https://council-tag-dev.herokuapp.com/api/add/message/';
    static Future<bool> sendMessage(User token, num agendaID, String content) async {
      var response = await http.post( MESSAGE_URL, body: {"content" : content, "ag_item" : agendaID});
      if( response.statusCode == 201 ){
        return true;
      } else {
        print( "********* Error message code : ${response.statusCode} ******");
        return false;
      }
    }
}