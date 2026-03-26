# EmergencyLink Mobile App

Flutter mobile frontend for EmergencyLink.

## Login UI

The app currently starts with a login screen styled after the provided design.

### Asset locations

- `assets/logo/logo.png` for the app logo
- `assets/image-assets/login_illustrations.png` for the login illustration

Both folders are registered in `pubspec.yaml`:

- `assets/logo/`
- `assets/image-assets/`

### Code location

- `Frontend/Mobile/lib/screens/home/login_screen.dart`

## Create Account UI

The login `Sign up` action now opens a dedicated create-account screen.

### Asset locations

- `assets/image-assets/createaccount_illustrations.png` for the create-account illustration

### Code location

- `Frontend/Mobile/lib/screens/auth/create_account_screen.dart`

## Account Created UI

Successful residency verification opens a dedicated account-created success screen.

### Asset locations

- `assets/image-assets/AccountCreated_illustrations.png` for the success illustration

### Code location

- `Frontend/Mobile/lib/screens/auth/account_created_screen.dart`

## Home Screen UI

Account-created `DONE` and top back action now route users to the home screen.

### Code location

- `Frontend/Mobile/lib/screens/home/home_screen.dart`

### Notes

- Notification action is placed at the upper-right header area as requested.
- Tapping the central `Help` button opens the emergency report form screen.
- Tapping bottom-nav `Reports` opens report history.
- Tapping the upper-right notification icon or bottom-nav `Notifications` opens notifications.
- Tapping bottom-nav `Settings` opens settings.

## Report History UI

The home bottom navigation `Reports` action opens a report history screen.

### Code location

- `Frontend/Mobile/lib/screens/home/report_history_screen.dart`

### Notes

- Tapping a report item opens a report-details screen.

## Report Details UI

Shows full incident data for a selected historical report, including summary, recording, media, and response details.

### Code location

- `Frontend/Mobile/lib/screens/home/report_details_screen.dart`

## Notifications UI

Displays emergency updates and responder status notifications with new/earlier grouping.

### Code location

- `Frontend/Mobile/lib/screens/home/notifications_screen.dart`

## Settings UI

Displays account info, emergency contacts, notification toggles, app permissions, and app/about actions.

### Code location

- `Frontend/Mobile/lib/screens/home/settings_screen.dart`

### Notes

- `Change Password` opens change-password screen.
- `Privacy & Security` opens dedicated privacy-security controls screen.

## Change Password UI

Allows users to update their password from settings. Successful update routes to the shared password-updated success screen.

### Code location

- `Frontend/Mobile/lib/screens/home/change_password_screen.dart`

## Privacy & Security UI

Provides privacy controls, security controls, and device session management.

### Code location

- `Frontend/Mobile/lib/screens/home/privacy_security_screen.dart`

## Emergency Report UI

The home `Help` action now opens an emergency-report form matching the provided mock.

### Code location

- `Frontend/Mobile/lib/screens/home/emergency_report_screen.dart`

### Notes

- Includes active recording indicator/state styling and selected media card states (Photo/Video) per the updated mock.
- Submitting a report now opens the emergency tracking screen.

## Emergency Tracking UI

After emergency-report submission, users are routed to a live emergency tracking screen.

### Code location

- `Frontend/Mobile/lib/screens/home/emergency_tracking_screen.dart`

## Verify Doyong Residency UI

After valid create-account submission, users are routed to residency verification.

### Asset locations

- `assets/image-assets/verifynumber_illustrations.png` for the top illustration

### Code location

- `Frontend/Mobile/lib/screens/verification/verify_doyong_residency_screen.dart`

## Outside Service Area UI

From residency screen, `Refresh GPS` opens the outside-service-area state.

### Asset locations

- `assets/image-assets/OutsideServiceArea_illustrations.png` for the out-of-area illustration

### Code location

- `Frontend/Mobile/lib/screens/verification/outside_service_area_screen.dart`

## Forgot Password UI

The login `Forgot Password?` action now opens a dedicated forgot-password screen.

### Asset locations

- `assets/image-assets/forgotpassword_illustrations.png` for the forgot-password illustration

### Code location

- `Frontend/Mobile/lib/screens/verification/forgot_password_screen.dart`

## Verify Number UI

The forgot-password `Request Verification Code` action now opens the verify-number screen.

### Asset locations

- `assets/image-assets/verifynumber_illustrations.png` for the verification illustration

### Code location

- `Frontend/Mobile/lib/screens/verification/verify_number_screen.dart`

## Create New Password UI

The verify-number `Verify Code` action now opens the create-new-password screen.

### Asset locations

- `assets/image-assets/verifynumber_illustrations.png` for the top illustration

### Code location

- `Frontend/Mobile/lib/screens/verification/create_new_password_screen.dart`

## Password Updated UI

The create-new-password `Reset Password` action now opens a password-updated success screen.

### Asset locations

- `assets/image-assets/PasswordUpdated_illustrations.png` for the success illustration

### Code location

- `Frontend/Mobile/lib/screens/verification/password_updated_screen.dart`

## Run

```bash
flutter pub get
flutter run
```

## Test

```bash
flutter test
```
