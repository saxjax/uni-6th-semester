import 'dart:core';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group("TEST_CLASS_NAME TEST_METHOD_NAME",() {
    test(
      """
        Should XXX
        When YYY
        Given ZZZ
      """,
      () async {
      // arrange

      // act

      // assert
    }, skip: true,
    tags: ["integrationtest","core","FOLDER_NAME","FILE_NAME","TEST_METHOD_NAME"]);
  });
}