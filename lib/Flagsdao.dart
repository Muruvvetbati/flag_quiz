import 'package:flag_quiz/DatabaseHelper.dart';
import 'package:flag_quiz/Flags.dart';

class Flagsdao{

  Future<List<Flags>> randomGet() async {
    var db = await DatabaseHelper.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM flags ORDER BY RANDOM() LIMIT 5");

    return List.generate(maps.length, (i)  {
        var satir = maps[i];
        return Flags(satir["flag_id"], satir["flag_name"], satir["flag_pic"]);
  });
  }

  Future<List<Flags>> random3Get(int flag_id) async {
    var db = await DatabaseHelper.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT*FROM flags WHERE flag_id != $flag_id ORDER BY RANDOM() LIMIT 3");

    return List.generate(maps.length, (i)  {
      var row = maps[i];
      return Flags(row["flag_id"], row["flag_name"], row["flag_pic"]);
    });
  }



}