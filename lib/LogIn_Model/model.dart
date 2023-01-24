import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class LogModel extends HiveObject {
  @HiveField(0)
  String userName;
  @HiveField(1)
  String password;

  LogModel(this.userName, this.password);
}
