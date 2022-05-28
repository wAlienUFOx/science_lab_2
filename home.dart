import 'package:flutter/material.dart';
import 'menu.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('MAI'),
        centerTitle: true,
        actions: [
          IconButton(
            icon:  Icon(Icons.menu),
            onPressed: () =>
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Menu())
                ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white60,
              Colors.grey
            ]
          )
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(onPressed: () {
                        Navigator.pushNamed(context, '/equipment');
                      },
                        iconSize: 100,
                        color: Colors.blue,
                        icon: Icon(Icons.settings),
                      ),
                      TextButton(onPressed: () {
                        Navigator.pushNamed(context, '/equipment');
                      }, child:  Text('Оборудование')),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(onPressed: () {
                        Navigator.pushNamed(context, '/planning');
                      },
                        iconSize: 100,
                        color: Colors.blue,
                        icon: Icon(Icons.calendar_today_sharp),
                      ),
                      TextButton(onPressed: () {
                        Navigator.pushNamed(context, '/planning');
                      }, child:  Text('Планирование')),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(onPressed: () {
                        Navigator.pushNamed(context, '/publications');
                      },
                        iconSize: 100,
                        color: Colors.blue,
                        icon: Icon(Icons.article),
                      ),
                      TextButton(onPressed: () {
                        Navigator.pushNamed(context, '/publications');
                      }, child:  Text('Публикации')),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(onPressed: () {
                        Navigator.pushNamed(context, '/projects');
                      },
                        iconSize: 100,
                        color: Colors.blue,
                        icon: Icon(Icons.design_services),
                      ),
                      TextButton(onPressed: () {
                        Navigator.pushNamed(context, '/projects');
                      }, child:  Text('Проекты')),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(onPressed: () {
                    Navigator.pushNamed(context, '/publish');
                  },
                    iconSize: 100,
                    color: Colors.blue,
                    icon: Icon(Icons.camera_alt),
                  ),
                  TextButton(onPressed: () {
                    Navigator.pushNamed(context, '/publish');
                  }, child:  Text('Опубликовать')),
                ],
              )
            ]
        ),
      ),
    );
  }
}