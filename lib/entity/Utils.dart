import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Utils {
  static Future<String> readFile(String filename) async {
    final directory = await getApplicationCacheDirectory();
    print(directory);
    final File file = File('${directory.path}/files/$filename');
    if (file.existsSync() == false) {
      return '';
    }
    return file.readAsString();
  }
}
