enum BackgroundTypes { center, top, right, left }

enum PageTransition { easeInAndOut, slideForward, slideBack }

enum ActiveDashboardView { addTag, scanTag, listTags }

enum ActiveNavigationPage {
  passwords,
  totp,
  secrets,
  syncMode,
  identities,
}

enum SyncTypes { full, partial, otc }

enum DeviceTypes { mobile, desktop, tablet }

enum SecretType { password, custom }

enum DeviceLockType { password, biometric, totp, none }
