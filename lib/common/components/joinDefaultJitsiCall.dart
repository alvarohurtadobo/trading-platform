import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:jitsi_meet/jitsi_meet.dart';


Future<void> joinDefaultJitsiCall() async {
  String? serverUrl ; // meet.jitsi.si (default)

  // Enable or disable any feature flag here
  // If feature flag are not provided, default values will be used
  // Full list of feature flags (and defaults) available in the README
  Map<FeatureFlagEnum, bool> featureFlags = {
    FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
  };
  if (!kIsWeb) {
    // Here is an example, disabling features for each platform
    if (Platform.isAndroid) {
      // Disable ConnectionService usage on Android to avoid issues (see README)
      featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
    } else if (Platform.isIOS) {
      // Disable PIP on iOS as it looks weird
      featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
    }
  }
  // Define meetings options here
  var options = JitsiMeetingOptions(room: "projetTradingDeafultRoom")
    ..serverURL = serverUrl
    ..subject = "Test call"
    ..userDisplayName = "User_${DateTime.now().toIso8601String()}"
    ..userEmail = "email_${DateTime.now().toIso8601String()}@mail.com"
    ..iosAppBarRGBAColor = "#0080FF80"
    ..audioOnly = true
    ..audioMuted = false
    ..videoMuted = true
    ..featureFlags.addAll(featureFlags)
    ..webOptions = {
      "roomName": "projectTradingDeafultRoom",
      "width": "100%",
      "height": "100%",
      "enableWelcomePage": false,
      "chromeExtensionBanner": null,
      "userInfo": {"displayName": "User_${DateTime.now().toIso8601String()}"}
    };

  debugPrint("JitsiMeetingOptions: $options");
  await JitsiMeet.joinMeeting(
    options,
    listener: JitsiMeetingListener(
        onConferenceWillJoin: (message) {
          debugPrint("${options.room} will join with message: $message");
        },
        onConferenceJoined: (message) {
          debugPrint("${options.room} joined with message: $message");
        },
        onConferenceTerminated: (message) {
          debugPrint("${options.room} terminated with message: $message");
        },
        genericListeners: [
          JitsiGenericListener(
              eventName: 'readyToClose',
              callback: (dynamic message) {
                debugPrint("readyToClose callback");
              }),
        ]),
  );
}
