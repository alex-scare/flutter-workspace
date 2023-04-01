import 'dart:convert';
import 'dart:io';

Map<String, dynamic> loadJson(String path) {
  final file = File(path);
  final contents = file.readAsStringSync();
  final json = jsonDecode(contents);
  if (json is Map<String, dynamic>) {
    return json;
  } else {
    throw FormatException('Invalid JSON in file: $path');
  }
}

void generateKeysForFile(String path, StringBuffer buffer) {
  final json = loadJson(path);

  for (final sectionKey in json.keys) {
    final section = json[sectionKey] as Map<String, dynamic>;

    for (final key in section.keys) {
      buffer.writeln(
          '  static const $sectionKey${key.camelCase} = \'$sectionKey:$key\';');
    }
  }
}

void generateKeys(List<String> jsonPaths, String outputPath) {
  final keys = <String>{};
  for (final path in jsonPaths) {
    final json = loadJson(path);
    final fileName = path.split('/').last.split('.').first;
    final extractedKeys = extractKeys(json);
    keys.addAll(extractedKeys.map((element) => '$fileName:$element'));
  }
  final generatedClass = generateClass(keys);

  writeFile(generatedClass, outputPath);
}

writeFile(String content, String outputPath) {
  final file = File(outputPath);

  String output = content;
  file.writeAsStringSync(output);
}

Set<String> extractKeys(Map<String, dynamic> json, {String prefix = ''}) {
  final keys = <String>{};
  json.forEach((key, value) {
    final fullKey = prefix.isNotEmpty ? '$prefix.$key' : key;
    if (value is Map<String, dynamic>) {
      keys.addAll(extractKeys(value, prefix: fullKey));
    } else {
      keys.add(fullKey);
    }
  });
  return keys;
}

String generateClass(Set<String> keys) {
  final buffer = StringBuffer();

  buffer.writeln('class L10nKey {');
  for (final key in keys) {
    final fieldName = key.replaceAll(RegExp(r'[^\w]+'), '_').toCamelCase();
    buffer.writeln('  static const $fieldName = \'$key\';');
  }
  buffer.writeln('}');

  return buffer.toString();
}

generateL10nKeysFile(Directory dir) {
  print(dir.path);
  final jsonFiles = Directory('${dir.path}/l10n/en_US')
      .listSync()
      .where((file) => file.path.endsWith('.json'))
      .map((file) => file.path)
      .toList();

  generateKeys(jsonFiles, '${dir.path}/lib/shared/l10n_key.g.dart');
}

void main() {
  final commonLocalesPath = 'l10n';

  Directory('packages')
      .listSync()
      .whereType<Directory>()
      .where((dir) => dir.hasNestedDirWithPath('$commonLocalesPath'))
      .forEach((dir) => generateL10nKeysFile(dir));
}

extension StringExtension on String {
  String get camelCase => splitMapJoin(
        RegExp(r'(?:^|_)(.)'),
        onMatch: (Match match) => match.group(1)!.toUpperCase(),
        onNonMatch: (String nonMatch) => '',
      );

  toCamelCase() {
    List<String> parts = split('_');
    String result = '';

    for (int i = 0; i < parts.length; i++) {
      String part = parts[i];
      if (i > 0) {
        result += part.substring(0, 1).toUpperCase() + part.substring(1);
      } else {
        result += part;
      }
    }

    return result;
  }
}

extension DirectoryExtensions on Directory {
  bool hasNestedDirWithPath(String path) {
    return listSync(recursive: true).any((element) {
      if (element is Directory) {
        return element.path.endsWith(path);
      }
      return false;
    });
  }
}
