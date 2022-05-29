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
        title:  const Text('В работе'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: ()=>
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Publications())
                  ),
              icon:  const Icon(Icons.swap_horiz)),
          IconButton(
            icon:  const Icon(Icons.menu),
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
          child:  const Icon(Icons.add),
          onPressed: () {
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title:  const Text('Добавить статью в работе'),
                shape:  const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                content:
                SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        decoration:  const InputDecoration(
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
                        decoration:  const InputDecoration(
                          labelText: 'Стадия производства',
                        ),
                        onChanged: (String stage){
                          publ.stage = stage;
                        },
                      ),
                      TextField(
                        decoration:  const InputDecoration(
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
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue
                    ),
                    child:  const Text('Добавить'),
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
          padding:  const EdgeInsets.all(8.0),
          child: Container(child:
          Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius:  const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10)
                ),
                child: Container(
                  decoration:  const BoxDecoration(
                    color: Colors.blue,
                  ),
                  height: 150,
                  child: Padding(
                    padding:  const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(e.name,
                          style:  const TextStyle(
                            color: Colors.white,
                          ),),
                        Text(e.stage,
                          style:  const TextStyle(
                            color: Colors.white,
                          ),),
                        TextButton(
                            onPressed: () {/*initialUrl: e.link;*/},
                            child: Text(e.link,
                              style:  const TextStyle(
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