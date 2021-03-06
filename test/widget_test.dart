import 'package:calpoly_tick_talk/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Basic rendering', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(CPPChat());

    // Verify that our counter starts at 0.
    expect(find.text('Firebase Meetup'), findsOneWidget);
    expect(find.text('January 1st'), findsNothing);
  });
}
