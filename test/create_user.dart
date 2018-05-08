import 'package:test/test.dart';

import 'package:engage_flutter/shared/user.dart';
import 'package:engage_flutter/posts/user_helper.dart';

void main() {
  test('sign up post', () async {
	  User alwaysFail = await UserHelper.createUser("test0", "test1@test.com", "password");

    User onlyPassOnce = await UserHelper.createUser("test5", "test4@test.com", "password");
	  expect(null, alwaysFail);

    var answer = "test5";
    expect(answer, onlyPassOnce.user);

  });
}