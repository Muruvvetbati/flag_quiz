import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static final String veritabaniAdi = "flagquiz.sqlite";

  static Future<Database> veritabaniErisim() async {
    String veritabaniYolu = join(await getDatabasesPath(), veritabaniAdi);

    if (await databaseExists(veritabaniYolu)) {
      print("Veritabani zaten var. Kopyalamaya gerek yok");
    } else {
      ByteData data = await rootBundle.load("database/$veritabaniAdi");
      List<int> bytes = data.buffer.asUint8List(
          data.offsetInBytes, data.lengthInBytes);
      await File(veritabaniYolu).writeAsBytes(bytes, flush: true);
      print("Veritabenı kopyalandı");
    }

    return openDatabase(veritabaniYolu);
  }
}

