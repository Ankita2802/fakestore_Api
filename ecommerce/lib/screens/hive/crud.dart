import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveCrudScreen extends StatefulWidget {
  const HiveCrudScreen({super.key});

  @override
  State<HiveCrudScreen> createState() => _HiveCrudScreenState();
}

class _HiveCrudScreenState extends State<HiveCrudScreen> {
  List<Map<String, dynamic>> items = [];
  final shoppingBox = Hive.box('shopping-box');
  @override
  void initState() {
    getitems();
    super.initState();
  }

  // get all items from database
  void getitems() {
    final data = shoppingBox.keys.map((key) {
      final value = shoppingBox.get(key);
      return {"key": key, "name": value["name"], "quantity": value['quantity']};
    }).toList();
    setState(() {
      items = data.reversed.toList();
    });
  }

  // create new items
  Future<void> createitems(Map<String, dynamic> newitems) async {
    await shoppingBox.add(newitems);
    getitems(); //update the ui
  }

  //retervie single items
  Map<String, dynamic> readitems(int key) {
    final item = shoppingBox.get(key);
    return item;
  }

  //update items
  Future<void> updateitems(int itemkeys, Map<String, dynamic> items) async {
    await shoppingBox.put(itemkeys, items);
    getitems();
  }

  //delete items
  Future<void> deleteitems(int itemkeys) async {
    await shoppingBox.delete(itemkeys);
    getitems();

    //display snackbar
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An item has been deleted')));
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  void showform(BuildContext ctx, int? itemkey) {
    if (itemkey != null) {
      final existingitem =
          items.firstWhere((element) => element['key'] == itemkey);
      nameController.text = existingitem['name'];
      quantityController.text = existingitem['quantity'];
    }
    showModalBottomSheet(
      context: ctx,
      elevation: 5.0,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
            top: 15.0,
            right: 15.0,
            left: 15.0,
          ),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Name'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: quantityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Quantity'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (itemkey == null) {
                      createitems({
                        "name": nameController.text,
                        "quantity": quantityController.text
                      });
                    }
                    if (itemkey != null) {
                      updateitems(itemkey, {
                        "name": nameController.text.trim(),
                        "quantity": quantityController.text.trim()
                      });
                    }
                    nameController.text = '';
                    quantityController.text = '';
                    Navigator.of(context).pop();
                  },
                  child: Text(itemkey == null ? 'craete new' : 'update'),
                ),
                const SizedBox(
                  height: 15,
                )
              ]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("shopping box"),
        centerTitle: true,
        backgroundColor: Colors.purple[300],
      ),
      body: items.isEmpty
          ? const Center(
              child: Text("No Data"),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final currentitems = items[index];
                return Card(
                  color: Colors.orange.shade100,
                  margin: const EdgeInsets.all(10),
                  elevation: 3,
                  child: ListTile(
                    title: Text(currentitems['name']),
                    subtitle: Text(currentitems['quantity']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              showform(context, currentitems['key']);
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              deleteitems(currentitems['key']);
                            },
                            icon: Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showform(context, null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
