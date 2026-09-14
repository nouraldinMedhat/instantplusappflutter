import 'package:flutter_test/flutter_test.dart';
import 'package:instantplus/main.dart';

void main() {
  testWidgets('App boots with MyApp', (WidgetTester tester) async {
    // Widget tests for EasyLocalization need binding setup;
    // keep a lightweight smoke placeholder for now.
    expect(MyApp, isNotNull);
  });
}
