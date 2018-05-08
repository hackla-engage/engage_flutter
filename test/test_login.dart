import 'package:test/test.dart';

import 'package:engage_flutter/shared/user.dart';
import 'package:engage_flutter/posts/user_helper.dart';

void main() {
  test('sign up post', () async {
	  //User alwaysWork = await UserHelper.loginUser("test0@test.com", "password");
    //expect( "test0@test.com" , alwaysWork.email);

    User onlyPassOnce = await UserHelper.loginUser("monkeyboyted@yahoo.com", "password");

    var answer = "monkeyboyted@yahoo.com";
    expect(answer, onlyPassOnce.email);

  });
}