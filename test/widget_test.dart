import 'package:flutter_test/flutter_test.dart';
import 'package:sivic/main.dart';

void main() {
  testWidgets('Sivic app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const Sivic());

    // Check that the app loads successfully
    expect(find.byType(Sivic), findsOneWidget);
  });
}