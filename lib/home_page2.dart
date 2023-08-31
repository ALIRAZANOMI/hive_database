import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  List<Map<String, dynamic>> _items = [];
  final _shopingBox = Hive.box("MyBox");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshItems();
  }

  void _refreshItems() {
    final data = _shopingBox.keys.map((key) {
      final item = _shopingBox.get(key);
      return {'key': key, 'name': item['name'], 'quantity': item['quantity']};
    }).toList();
    setState(() {
      _items = data.reversed.toList();
      print(_items.length);
    });
  }

  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _shopingBox.add(newItem);
    _refreshItems();
  }

  void _showForm(BuildContext, ctx, int? itemKey) {
    showModalBottomSheet(
        context: ctx,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) {
          return Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(hintText: "Name"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Quantity"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        _createItem({
                          'name': _nameController.text,
                          'quantity': _quantityController.text,
                        });

                        _nameController.text = '';
                        _quantityController.text = '';
                        Navigator.of(context).pop();
                      },
                      child: Text("Create New")),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hive"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showForm(BuildContext, context, null);
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (_, index) {
            final curruntItem = _items[index];
            return Card(
              color: Colors.green[900],
              margin: EdgeInsets.all(12),
              elevation: 3,
              child: ListTile(
                title: Text(
                  curruntItem["name"],
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(curruntItem["quantity"].toString(),
                    style: TextStyle(color: Colors.white)),
              ),
            );
          },
        ));
  }
}
