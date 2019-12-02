import 'dart:io';

Future<void> main(List<String> arguments) {
  final day = int.parse(arguments.first);
  final templateDir = Directory("template");
  if (!templateDir.existsSync()) {
    throw "'template' dir not found";
  }

  final files = templateDir.listSync(recursive: true);
  for (final entity in files) {
    final file = File(entity.path);
  }
}
