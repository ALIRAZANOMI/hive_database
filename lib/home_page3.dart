import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/boxes/boxes.dart';
import 'package:hive_database/model/notes_model.dart';
import 'package:hive_flutter/adapters.dart';

class HomePage3 extends StatefulWidget {
  @override
  _HomePage3State createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  // Future<void> _edit(NotesModel notesModel, String tittle, String description) {
  //   _tittleController.text = tittle;
  //   _descriptionController.text = description;
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text("Edit Notes"),
  //           content: SingleChildScrollView(
  //             child: Column(
  //               children: <Widget>[
  //                 TextFormField(
  //                   controller: _tittleController,
  //                   decoration: InputDecoration(
  //                       hintText: "Enter tittle", border: OutlineInputBorder()),
  //                 ),
  //                 SizedBox(
  //                   height: 15,
  //                 ),
  //                 TextFormField(
  //                   controller: _descriptionController,
  //                   decoration: InputDecoration(
  //                       hintText: "Enter description",
  //                       border: OutlineInputBorder()),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           actions: [
  //             TextButton(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: Text("Cancel")),
  //             TextButton(
  //                 onPressed: () async {
  //                   notesModel.tittle = _tittleController.text.toString();
  //
  //                   notesModel.description =
  //                       _descriptionController.text.toString();
  //
  //                   await notesModel.save();
  //                   _tittleController.clear();
  //                   _descriptionController.clear();
  //
  //                   Navigator.pop(context);
  //                 },
  //                 child: Text("Edit"))
  //           ],
  //         );
  //       });
  // }
  //
  // void _delete(NotesModel notesModel) async {
  //   await notesModel.delete();
  // }

  TextEditingController _tittleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive"),
      ),
      body: ValueListenableBuilder<Box<NotesModel>>(
        valueListenable: boxes.getData().listenable(),
        builder: (context, box, _) {
          var data = box.values.toList().cast<NotesModel>();
          return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 80,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 10, top: 10, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                data[index].tittle.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              Spacer(),
                              // InkWell(
                              //     onTap: () {
                              //       _edit(
                              //           data[index],
                              //           data[index].tittle.toString(),
                              //           data[index].description.toString());
                              //     },
                              //     child: Icon(Icons.edit)),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  // _delete(data[index]);
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          Text(data[index].description.toString()),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDilogeAlert();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showDilogeAlert() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add Notes"),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _tittleController,
                    decoration: InputDecoration(
                        hintText: "Enter tittle", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                        hintText: "Enter description",
                        border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () {
                    final data = NotesModel(
                        tittle: _tittleController.text,
                        description: _descriptionController.text);
                    final box = boxes.getData();
                    print(box.add(data));

                    // data.save();
                    _tittleController.clear();
                    _descriptionController.clear();
                    print(box);
                    Navigator.pop(context);
                  },
                  child: Text("Add"))
            ],
          );
        });
  }
}
