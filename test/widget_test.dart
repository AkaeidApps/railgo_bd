import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:railgo_bd/app.dart';
import 'package:railgo_bd/core/constants/app_constants.dart';
import 'package:railgo_bd/core/services/storage_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    // Keep widget tests hermetic: no platform channel, no network fetch.
    SharedPreferences.setMockInitialValues(<String, Object>{
      AppConstants.keyLanguage: 'en',
      AppConstants.keyIsFirstTime: true,
    });
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('RailGo BD smoke test', (WidgetTester tester) async {
    await Get.putAsync(() => StorageService().init());

    await tester.pumpWidget(const RailGoApp());
    await tester.pump();

    expect(find.text(AppConstants.appName), findsOneWidget);

    // Let the 2s splash delay fire so no timers are left pending,
    // then settle the splash -> onboarding transition.
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    Get.reset();
  });
}
