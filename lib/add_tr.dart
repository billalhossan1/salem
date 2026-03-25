import 'dart:io';
import 'package:get/get.dart';

void main() {
  var dir = Directory('lib');
  var files = dir
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart'));

  // Pattern for hardcoded strings
  var stringPattern = RegExp(
    r'''(Text\(\s*|text\s*:\s*|hintText\s*:\s*|label\s*:\s*|titleText\s*:\s*|buttonText\s*:\s*|subtitle\s*:\s*)(['"])(.*?)\2(?!\s*\.tr)''',
  );

  // Pattern for AppString usage
  var appStringPattern = RegExp(r'''(AppString\.[a-zA-Z0-9_]+)(?!\s*\.tr)''');

  Set<String> extractedStrings = {};

  for (var file in files) {
    if (file.path.contains('app_string.dart') ||
        file.path.contains('app_translations.dart') ||
        file.path.contains('add_tr.dart')) {
      continue;
    }

    var content = file.readAsStringSync();
    var originalContent = content;
    var newContent = content;

    // Replace hardcoded strings
    newContent = newContent.replaceAllMapped(stringPattern, (match) {
      extractedStrings.add(match.group(3)!);
      return '${match.group(1)}${match.group(2)}${match.group(3)}${match.group(2)}.tr';
    });

    // Replace AppString constants
    newContent = newContent.replaceAllMapped(appStringPattern, (match) {
      return '${match.group(1)}.tr';
    });

    if (originalContent != newContent) {
      file.writeAsStringSync(newContent);
      print('Updated ${file.path}');
    }
  }

  var outFile = File('lib/extracted_strings.txt');
  outFile.writeAsStringSync(extractedStrings.join('\n'));
  print('Wrote extracted strings to lib/extracted_strings.txt');
}
