import 'dart:io';

void main() {
  Directory dir = Directory('lib');
  List<File> files = dir
      .listSync(recursive: true)
      .whereType<File>()
      .where((element) => element.path.endsWith('.dart'))
      .toList();

  for (File file in files) {
    if (file.path.contains('app_string.dart') ||
        file.path.contains('app_translations.dart'))
      continue;

    String content = file.readAsStringSync();

    if (content.contains('.tr') &&
        !content.contains("import 'package:get/get.dart';")) {
      // Find the last import
      int lastImportIndex = content.lastIndexOf(RegExp(r'import\s+[^;]+;'));
      if (lastImportIndex != -1) {
        int insertIndex = content.indexOf('\n', lastImportIndex) + 1;
        String newContent =
            content.substring(0, insertIndex) +
            "import 'package:get/get.dart';\n" +
            content.substring(insertIndex);
        file.writeAsStringSync(newContent);
        print('Fixed imports in ${file.path}');
      } else {
        // No imports, just add at top
        file.writeAsStringSync("import 'package:get/get.dart';\n\n" + content);
        print('Fixed imports in ${file.path}');
      }
    }
  }
}
