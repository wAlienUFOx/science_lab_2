import 'package:flutter/material.dart';
import 'package:science_lab_2/pages/project_event.dart';
import 'menu.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class Project {
  String name;
  String description;
  String stage;

  Project(this.name, this.description, this.stage);

  Project.withNone({
    this.name = 'null',
    this.description = 'null',
    this.stage = 'null',
  });

}

class _ProjectsState extends State<Projects> {

  List <Project> data = [
    Project("Проект 1", "описание 1", "Планирование операций"),
    Project("Другой проект", "другое описание", "Подготовка отчёта"),
  ];

  Project proj = Project.withNone();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Проекты'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: ()=>
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Project_event())
                  ),
              icon:  Icon(Icons.event)),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () =>
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Menu())
                ),
          ),
        ],
      ),
      body: ListView(
        children: _buildList(),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          child:  Icon(Icons.add),
          onPressed: () {
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title:  Text('Добавить информацию о проекте'),
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                content:
                SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        decoration:  InputDecoration(
                          labelText: 'Название проекта',
                        ),
                        onChanged: (String name){
                          proj.name = name;
                        },
                      ),
                      TextField(
                        decoration:  InputDecoration(
                          labelText: 'Описание',
                        ),
                        onChanged: (String description){
                          proj.description = description;
                        },
                      ),
                      TextField(
                        decoration:  InputDecoration(
                          labelText: 'Стадия реализации',
                        ),
                        onChanged: (String stage){
                          proj.stage = stage;
                        },
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        data.add(Project(proj.name, proj.description, proj.stage));
                      });
                      Navigator.of(context).pop();
                    },
                    child:  Text('Добавить'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue
                    ),
                  )
                ],
              );
            });
          }
      ),
    );
  }


  List<Widget> _buildList(){
    return data.map((Project e) =>
        Padding(
          padding:  EdgeInsets.all(8.0),
          child: Container(child:
          Expanded(
              flex: 7,
              child: ClipRRect(
                borderRadius:  BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10)
                ),
                child: Container(
                  decoration:  BoxDecoration(
                    color: Colors.blue,
                  ),
                  height: 150,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(e.name,
                          style:  TextStyle(
                            color: Colors.white, fontSize: 20
                          ),),
                        Text(e.description,
                          style:  TextStyle(
                            color: Colors.white,
                          ),),
                        Text(e.stage,
                          style:  TextStyle(
                            color: Colors.white,
                          ),),
                      ],
                    ),
                  ),
                ),
              )
          )),
        )
    ).toList();
  }
}