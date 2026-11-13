import 'package:flutter_test/flutter_test.dart';
import 'package:rajang_river_cruise/main.dart';

void main() {
  testWidgets('Rajang Cruise app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const RajangCruiseApp());

    // Verify that the title appears on screen.
    expect(find.text('Rajang River Express Cruise'), findsOneWidget);
  });
}