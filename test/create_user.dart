import 'package:test/test.dart';

import 'package:engage_flutter/shared/user.dart';
import 'package:engage_flutter/posts/signup_helper.dart';

void main() {
  test('sign up post', () async {
	  User alwaysFail = await UserHelper.createUser("test0", "test@test.com", "password");

    User onlyPassOnce = await UserHelper.createUser("test4", "test@test.com", "password");
	  expect(null, alwaysFail);

    var answer = "test4";
    expect(answer, onlyPassOnce.user);

  });
}