
import 'dart:convert';
import 'dart:io';

Future<List<String>> getBase64Images(List<File> files) async {
  return await Future.wait(files.map((file) async {
    final bytes = await file.readAsBytes();
    final extension = file.path.split('.').last.toLowerCase();

    // Detectar tipo MIME básico
    final mimeType = {
      'jpg': 'image/jpeg',
      'jpeg': 'image/jpeg',
      'png': 'image/png',
      'gif': 'image/gif',
      'webp': 'image/webp',
    }[extension] ?? 'application/octet-stream';

    final base64Str = base64Encode(bytes);
    return 'data:$mimeType;base64,$base64Str';
  }));
}