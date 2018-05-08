import 'package:http/http.dart' as http;
import 'package:test/test.dart';


void main() {
  test('generic post', () async {
	  var response = await http.post( "http://httpbin.org/post", body: {"name":"email"});
    print(response.body);
  });
}