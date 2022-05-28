import 'package:flutter/material.dart';
import 'menu.dart';
import 'publications.dart';

class PublicationsInProgress extends StatefulWidget {
  const PublicationsInProgress({Key? key}) : super(key: key);

  @override
  State<PublicationsInProgress> createState() => _PublicationsInProgressState();
}

class PublicationInProgress {
  String name;
  String stage;
  String link;

  PublicationInProgress(this.name, this.stage, this.link);

  PublicationInProgress.withNone({
    this.name = 'null',
    this.stage = 'null',
    this.link = 'null',
  });

}

class _PublicationsInProgressState extends State<PublicationsInProgress> {

  List <PublicationInProgress> dataP = [
    PublicationInProgress("Исследование Л.А.", "n/a", "https://tut.com"),
    PublicationInProgress("Полёты мысли", "n/a", "https://tamt.com"),
  ];

  PublicationInProgress publ = PublicationInProgress.withNone();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('В работе'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: ()=>
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Publications())
                  ),
              icon:  Icon(Icons.swap_horiz)),
          IconButton(
            icon:  Icon(Icons.menu),
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
                title:  Text('Добавить статью в работе'),
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                content:
                SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        decoration:  InputDecoration(
                          labelText: 'Название статьи',
                        ),
                        onChanged: (String name){
                          publ.name = name;
                        },
                      ),
                      /*DropdownButton(
                          items: <String>['Идея', 'Работа над текстом', 'Анализ литературы' ,'Корректировка текста','Перевод','Отправка','Редактура','Публикация'].map((String stage){
                            return DropdownMenuItem<String>(
                                value: stage,
                                child: Text(stage),);
                          }).toList(),
                        onChanged: (_){},
                      ),*/
                      TextField(
                        decoration:  InputDecoration(
                          labelText: 'Стадия производства',
                        ),
                        onChanged: (String stage){
                          publ.stage = stage;
                        },
                      ),
                      TextField(
                        decoration:  InputDecoration(
                          labelText: 'Ссылка на среду производства',
                        ),
                        onChanged: (String link){
                          publ.link = link;
                        },
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        dataP.add(PublicationInProgress(publ.name, publ.stage, publ.link));
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
    return dataP.map((PublicationInProgress e) =>
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
                            color: Colors.white,
                          ),),
                        Text(e.stage,
                          style:  TextStyle(
                            color: Colors.white,
                          ),),
                        TextButton(
                            onPressed: () {/*initialUrl: e.link;*/},
                            child: Text(e.link,
                              style:  TextStyle(
                                color: Colors.white,
                              ),)
                        )
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