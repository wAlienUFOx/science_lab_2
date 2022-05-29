import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _Menu();
}

class _Menu extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Меню'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/');
          },
              style: ElevatedButton.styleFrom(
                minimumSize:  const Size(double.infinity, 40.0),),
              child:  const Text('На главную')),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/equipment');
          },
              style: ElevatedButton.styleFrom(
                minimumSize:  const Size(double.infinity, 40.0),),
              child:  const Text('Оборудование')),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/planning');
          },
              style: ElevatedButton.styleFrom(
                minimumSize:  const Size(double.infinity, 40.0),),
              child:  const Text('Планирование')),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/publications');
          },
              style: ElevatedButton.styleFrom(
                minimumSize:  const Size(double.infinity, 40.0),),
              child:  const Text('Публикации')),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/projects');
          },
              style: ElevatedButton.styleFrom(
                minimumSize:  const Size(double.infinity, 40.0),),
              child:  const Text('Проекты')),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/publish');
          },
              style: ElevatedButton.styleFrom(
                minimumSize:  const Size(double.infinity, 40.0),),
              child:  const Text('Опубликовать')),
        ],
      ),
    );
  }
}