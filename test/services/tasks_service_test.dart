import 'package:flutter_test/flutter_test.dart';
import 'package:tasks_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('TasksServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
