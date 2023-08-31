import 'package:hive/hive.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 0)
class NotesModel extends HiveObject {
  @HiveField(0)
  String tittle;
  @HiveField(1)
  String description;

  NotesModel({required this.tittle, required this.description});
}
