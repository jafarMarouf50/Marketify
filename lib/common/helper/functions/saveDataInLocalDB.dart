part of '../../index.dart';

void saveData<T>(T items, String boxName) async {
  var box = Hive.box<T>(boxName);
  int result = await box.add(items);
  log("=========save in hive:$result===================");
}
