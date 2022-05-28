import 'package:flutter/material.dart';
import 'menu.dart';

class Equipment extends StatefulWidget {
  const Equipment({Key? key}) : super(key: key);

  @override
  State<Equipment> createState() => _EquipmentState();
}

class _EquipmentState extends State<Equipment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Оборудование'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () =>
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Menu())
                ),
          ),
        ],
      ),
    );
  }
}