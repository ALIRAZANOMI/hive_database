import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'animated_cross_fade.dart';
import 'home_page3.dart';
import 'model/notes_model.dart';


void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
var directory=await getApplicationDocumentsDirectory();

  Hive.init(directory.path);
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>("notes");
  await Hive.initFlutter();
   await Hive.openBox("MyBox");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Animatedcrossfade(),
    );
  }
}
