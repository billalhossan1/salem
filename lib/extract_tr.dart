import 'dart:io';
import 'package:get/get.dart';

void main() {
  Directory dir = Directory('lib');
  List<File> files = dir
      .listSync(recursive: true)
      .whereType<File>()
      .where((element) => element.path.endsWith('.dart'))
      .toList();

  Set<String> uniqueTranslations = {};

  // Also collect AppString occurrences
  Set<String> appStringUsages = {};

  RegExp trStringRegex = RegExp(r'''(['"])(?<text>.+?)\1\s*\.tr''');
  RegExp appStringRegex = RegExp(r'''(AppString\.[a-zA-Z0-9_]+)\s*\.tr''');

  for (File file in files) {
    if (file.path.contains('app_string.dart') ||
        file.path.contains('app_translations.dart') ||
        file.path.contains('add_tr.dart') ||
        file.path.contains('extract_tr.dart'))
      continue;

    String content = file.readAsStringSync();

    // Find strings with .tr
    Iterable<RegExpMatch> trMatches = trStringRegex.allMatches(content);
    for (RegExpMatch match in trMatches) {
      String text = match.namedGroup('text')!;
      if (!text.contains(r'${')) {
        // Ignore string interpolation for now, to keep it simple
        uniqueTranslations.add(text);
      }
    }

    // Find AppString usages
    Iterable<RegExpMatch> appStringMatches = appStringRegex.allMatches(content);
    for (RegExpMatch match in appStringMatches) {
      appStringUsages.add(match.group(1)!);
    }
  }

  // Read app_string.dart to map AppString constants to their original text
  File appStringFile = File('lib/utils/app_string/app_string.dart');
  String appStringContent = appStringFile.readAsStringSync();
  Map<String, String> appStringMap = {};

  RegExp staticConstRegex = RegExp(
    r'''static\s+const\s+String\s+([a-zA-Z0-9_]+)\s*=\s*(['"])(.*?)\2;''',
  );
  Iterable<RegExpMatch> scMatches = staticConstRegex.allMatches(
    appStringContent,
  );
  for (RegExpMatch match in scMatches) {
    appStringMap['AppString.${match.group(1)}'] = match.group(3)!;
  }

  // Combine both literal strings and AppString variable texts
  for (String appStr in appStringUsages) {
    if (appStringMap.containsKey(appStr)) {
      uniqueTranslations.add(appStringMap[appStr]!);
    }
  }

  File outFile = File('lib/final_extracted_strings.txt');
  outFile.writeAsStringSync(uniqueTranslations.join('\n'));
  print(
    'Extracted ${uniqueTranslations.length} unique strings to lib/final_extracted_strings.txt',
  );
}
