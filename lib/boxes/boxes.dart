



import 'package:hive/hive.dart';

import '../model/notes_model.dart';

class boxes{
  static Box<NotesModel> getData() => Hive.box<NotesModel>("notes");
}