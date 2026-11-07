# Persian PDF shaping test app

This single-screen Flutter app lets you select a Persian-capable font, generate
a PDF sample containing Persian text, Persian digits, numeric separators, and
English text, preview it in the app, then save and open it in macOS's default
PDF viewer.

## Run on macOS

From this directory, generate the macOS runner if it is not present, then run:

```sh
flutter create --platforms=macos --project-name persian_pdf_fixer_example .
flutter pub get
flutter run -d macos
```

Select a `.ttf` or `.otf` font such as `Estedad-Regular.ttf` or
`Vazirmatn-Regular.ttf`, choose **Generate preview**, then choose **Save and
open PDF**.

For macOS sandboxed builds, add this entitlement to both
`macos/Runner/DebugProfile.entitlements` and
`macos/Runner/Release.entitlements` so the native font and save panels can
access user-selected files:

```xml
<key>com.apple.security.files.user-selected.read-write</key>
<true/>
```

The example's `pubspec.yaml` points `pdf_text_shaper` at this repository's
local core package, so it exercises the current RTL-number fix. Remove that
override if you want to test only the published package version.
