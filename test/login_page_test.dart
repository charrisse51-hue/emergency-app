import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_prj/main.dart';

const String _kTransparentPngBase64 =
    'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+Xk3sAAAAASUVORK5CYII=';
final Uint8List _transparentPngBytes = Uint8List.fromList(base64Decode(_kTransparentPngBase64));

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    final messenger = TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMessageHandler('flutter/assets', (message) async {
      // Provide a valid PNG so `Image.asset` can decode during widget tests.
      return ByteData.view(_transparentPngBytes.buffer);
    });
  });

  testWidgets('renders login screen widgets', (tester) async {
    await tester.pumpWidget(const EmergencyApp());

    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text('Log in to EmergencyLink'), findsOneWidget);
    expect(find.text('Phone Number'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Log In'), findsOneWidget);
  });

  testWidgets('shows required field errors when empty', (tester) async {
    await tester.pumpWidget(const EmergencyApp());

    await tester.tap(find.text('Log In'));
    await tester.pump();

    expect(find.text('Phone number is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);
  });

  testWidgets('navigates to forgot password screen', (tester) async {
    await tester.pumpWidget(const EmergencyApp());

    await tester.tap(find.text('Forgot Password?'));
    await tester.pumpAndSettle();

    expect(find.text('Forgot Password'), findsOneWidget);
    expect(find.text('Recover your RescueLink account securely'), findsOneWidget);
    expect(find.text('Request Verification Code'), findsOneWidget);
  });

  testWidgets('navigates to create account screen', (tester) async {
    await tester.pumpWidget(const EmergencyApp());

    await tester.tap(find.text('Sign up'));
    await tester.pumpAndSettle();

    expect(find.text('Create Account'), findsOneWidget);
    expect(find.text('Join RescueLink Dagupan City'), findsOneWidget);
  });

  testWidgets('shows validation errors on empty create account submission', (tester) async {
    await tester.pumpWidget(const EmergencyApp());

    await tester.tap(find.text('Sign up'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Create Account'));
    await tester.pump();

    expect(find.text('First name is required'), findsOneWidget);
    expect(find.text('Last name is required'), findsOneWidget);
    expect(find.text('Phone number is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);
    expect(find.text('Please confirm your password'), findsOneWidget);
  });

  testWidgets('navigates to verify doyong residency after valid create account submit', (tester) async {
    await tester.pumpWidget(const EmergencyApp());

    await tester.tap(find.text('Sign up'));
    await tester.pumpAndSettle();

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'Juan');
    await tester.enterText(fields.at(1), 'Dela Cruz');
    await tester.enterText(fields.at(2), '09171234567');
    await tester.enterText(fields.at(3), 'Strong@123');
    await tester.enterText(fields.at(4), 'Strong@123');
    await tester.tap(find.text('Create Account'));
    await tester.pumpAndSettle();

    expect(find.text('Verify Doyong Residency'), findsOneWidget);
    expect(find.text('Confirm your identity and location'), findsOneWidget);
    expect(find.text('Verification'), findsOneWidget);
  });

  testWidgets('opens outside service area from refresh gps', (tester) async {
    await tester.pumpWidget(const EmergencyApp());

    await tester.tap(find.text('Sign up'));
    await tester.pumpAndSettle();
    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'Juan');
    await tester.enterText(fields.at(1), 'Dela Cruz');
    await tester.enterText(fields.at(2), '09171234567');
    await tester.enterText(fields.at(3), 'Strong@123');
    await tester.enterText(fields.at(4), 'Strong@123');
    await tester.tap(find.text('Create Account'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Refresh GPS'));
    await tester.pumpAndSettle();

    expect(find.text('Outside Service Area'), findsOneWidget);
    expect(find.text('Retry Location Verification'), findsOneWidget);
    expect(find.text('Go Back'), findsOneWidget);
  });

  testWidgets('navigates to account created from residency verification', (tester) async {
    await tester.pumpWidget(const EmergencyApp());

    await tester.tap(find.text('Sign up'));
    await tester.pumpAndSettle();
    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'Juan');
    await tester.enterText(fields.at(1), 'Dela Cruz');
    await tester.enterText(fields.at(2), '09171234567');
    await tester.enterText(fields.at(3), 'Strong@123');
    await tester.enterText(fields.at(4), 'Strong@123');
    await tester.tap(find.text('Create Account'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Verification'));
    await tester.pumpAndSettle();

    expect(find.text('Account\nCreated!'), findsOneWidget);
    expect(find.text('Back to Log In'), findsOneWidget);
    expect(find.text('DONE'), findsOneWidget);

    await tester.tap(find.text('DONE'));
    await tester.pumpAndSettle();

    expect(find.text('Quick Access'), findsOneWidget);
    expect(find.text('Emergency Tips'), findsOneWidget);
    expect(find.byTooltip('Notifications'), findsOneWidget);

    await tester.tap(find.byTooltip('Notifications'));
    await tester.pumpAndSettle();

    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Emergency updates & alerts'), findsOneWidget);
    expect(find.text('Mark all as Read'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.home_outlined));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();

    expect(find.text('Manage your account & preferences'), findsOneWidget);
    await tester.tap(find.text('Change Password'));
    await tester.pumpAndSettle();
    expect(find.text('Change Password'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField).at(0), 'Current@123');
    await tester.enterText(find.byType(TextFormField).at(1), 'NewPass@123');
    await tester.enterText(find.byType(TextFormField).at(2), 'NewPass@123');
    await tester.tap(find.text('Update Your Password'));
    await tester.pumpAndSettle();
    expect(find.text('Password\nUpdated!'), findsOneWidget);

    await tester.tap(find.text('Back to Login'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Reports'));
    await tester.pumpAndSettle();

    expect(find.text('Report History'), findsOneWidget);
    expect(find.text('Your past emergency reports'), findsOneWidget);

    await tester.tap(find.text('Fire Emergency'));
    await tester.pumpAndSettle();

    expect(find.text('Report Details'), findsOneWidget);
    expect(find.text('Incident Summary'), findsOneWidget);
    expect(find.text('Response Details'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_back).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.home_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Help'));
    await tester.pumpAndSettle();

    expect(find.text('Emergency Report'), findsOneWidget);
    expect(find.text('Voice Recording'), findsOneWidget);
    expect(find.text('Submit Emergency Report'), findsOneWidget);

    await tester.tap(find.text('Submit Emergency Report'));
    await tester.pumpAndSettle();

    expect(find.text('Emergency Tracking'), findsOneWidget);
    expect(find.text('Estimated Time of Arrival'), findsOneWidget);
    expect(find.text('Status Timeline'), findsOneWidget);
  });

  testWidgets('navigates to verify number screen', (tester) async {
    await tester.pumpWidget(const EmergencyApp());

    await tester.tap(find.text('Forgot Password?'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Request Verification Code'));
    await tester.pumpAndSettle();

    expect(find.text('Verify Your Number'), findsOneWidget);
    expect(find.text('Enter the code we sent you'), findsOneWidget);
    expect(find.text('Verify Code'), findsOneWidget);
  });

  testWidgets('navigates to create new password screen', (tester) async {
    await tester.pumpWidget(const EmergencyApp());

    await tester.tap(find.text('Forgot Password?'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Request Verification Code'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Verify Code'));
    await tester.pumpAndSettle();

    expect(find.text('Create New Password'), findsOneWidget);
    expect(find.text('Choose a strong password'), findsOneWidget);
    expect(find.text('Reset Password'), findsOneWidget);
  });

  testWidgets('shows validation errors for invalid reset password submission', (tester) async {
    await tester.pumpWidget(const EmergencyApp());

    await tester.tap(find.text('Forgot Password?'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Request Verification Code'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Verify Code'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Reset Password'));
    await tester.pump();

    expect(find.text('New password is required'), findsOneWidget);
    expect(find.text('Please confirm your new password'), findsOneWidget);
  });

  testWidgets('navigates to password updated screen after valid reset', (tester) async {
    await tester.pumpWidget(const EmergencyApp());

    await tester.tap(find.text('Forgot Password?'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Request Verification Code'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Verify Code'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).at(0), 'Strong@123');
    await tester.enterText(find.byType(TextFormField).at(1), 'Strong@123');
    await tester.tap(find.text('Reset Password'));
    await tester.pumpAndSettle();

    expect(find.text('Password\nUpdated!'), findsOneWidget);
    expect(find.text('Back to Login'), findsOneWidget);
  });
}
