import 'package:get/get.dart';

/// Translate text that can come dynamically from API.
///
/// GetX's `.tr` works only when the input is a *translation key*.
/// For API-provided content (which can change anytime), you typically need the
/// backend to send a stable key (recommended). Until then, this helper:
///
/// 1) If [raw] already exists as a key in translations, it returns `raw.tr`.
/// 2) Else tries common normalization (trim/lowercase) used in some projects.
/// 3) Else falls back to the original [raw].
///
/// This avoids showing `null` or crashing, and still supports translating
/// values that match existing keys.
String dynamicTr(String raw) {
  final value = raw.trim();
  if (value.isEmpty) return value;

  // 1) Exact match key
  final exact = value.tr;
  if (exact != value) return exact;

  // 2) Try normalized match (optional)
  final normalized = value.toLowerCase();
  if (normalized != value) {
    final normTr = normalized.tr;
    if (normTr != normalized) return normTr;
  }

  // 3) Fallback: show API value as-is
  return value;
}

