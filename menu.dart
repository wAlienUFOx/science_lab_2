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
        title:  Text('Меню'),
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
                minimumSize:  Size(double.infinity, 40.0),),
              child:  Text('На главную')),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/equipment');
          },
              style: ElevatedButton.styleFrom(
                minimumSize:  Size(double.infinity, 40.0),),
              child:  Text('Оборудование')),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/planning');
          },
              style: ElevatedButton.styleFrom(
                minimumSize:  Size(double.infinity, 40.0),),
              child:  Text('Планирование')),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/publications');
          },
              style: ElevatedButton.styleFrom(
                minimumSize:  Size(double.infinity, 40.0),),
              child:  Text('Публикации')),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/projects');
          },
              style: ElevatedButton.styleFrom(
                minimumSize:  Size(double.infinity, 40.0),),
              child:  Text('Проекты')),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/publish');
          },
              style: ElevatedButton.styleFrom(
                minimumSize:  Size(double.infinity, 40.0),),
              child:  Text('Опубликовать')),
        ],
      ),
    );
  }
}