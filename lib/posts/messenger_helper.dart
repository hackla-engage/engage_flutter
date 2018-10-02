import 'dart:core';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../shared/agenda_entry.dart';
import '../shared/user.dart';
import '../url/engage_backend.dart';

class AgendaMessenger {
    static const String MESSAGE_URL = ENGAGE_BACKEND_API_URL + '/add/message/';
    static Future<bool> sendMessage(User token, num agendaID, String content) async {
      var response = await http.post( MESSAGE_URL, body: {"content" : content, "ag_item" : agendaID, "to": token.token});
      if( response.statusCode == 201 ){
        return true;
      } else {
        print( "********* Error sending message code : ${response.statusCode} ******");
        return false;
      }
    }
}