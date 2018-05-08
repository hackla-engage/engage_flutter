import 'package:test/test.dart';

import 'package:engage_flutter/shared/user.dart';
import 'package:engage_flutter/posts/user_helper.dart';

void main() {
  test('sign up post', () async {
	  //User alwaysWork = await UserHelper.loginUser("test0@test.com", "password");
    //expect( "test0@test.com" , alwaysWork.email);

    User onlyPassOnce = await UserHelper.loginUser("test4@test.com", "password");

    var answer = "test4@test.com";
    expect(answer, onlyPassOnce.email);

  });
}