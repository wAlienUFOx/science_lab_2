import 'package:flutter/material.dart';
import 'menu.dart';
import 'publications_in_progress.dart';

class Publications extends StatefulWidget {
  const Publications({Key? key}) : super(key: key);

  @override
  State<Publications> createState() => _PublicationsState();
}

class PublicationDone {
  String name;
  String authors;
  String year;
  String magazine;
  String citation;
  String link;

  PublicationDone(this.name, this.authors, this.year, this.magazine, this.citation, this.link);

  PublicationDone.withNone({
    this.name = 'null',
    this.authors = 'null',
    this.year = 'null',
    this.magazine = 'null',
    this.citation = 'null',
    this.link = 'null',
  });

}

class _PublicationsState extends State<Publications> {

  List <PublicationDone> data = [
    PublicationDone("Исследование Л.А.", "Uhov P.A.", "2013", "MAI", "7", "https://tut.com"),
    PublicationDone("Запуск бумажных самолётов и наблюдение за ними долго-долго", "Anisimov V.A.", "2022", "MAI", "0", "https://tam.com"),
  ];

  PublicationDone publ = PublicationDone.withNone();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Публикации'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: ()=>
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PublicationsInProgress())
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
                title:  Text('Добавить статью'),
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
                      TextField(
                        decoration:  InputDecoration(
                          labelText: 'Цитирований',
                        ),
                        onChanged: (String citation){
                          publ.citation = citation;
                        },
                      ),
                      TextField(
                        decoration:  InputDecoration(
                          labelText: 'Авторы',
                        ),
                        onChanged: (String authors){
                          publ.authors = authors;
                        },
                      ),
                      TextField(
                        decoration:  InputDecoration(
                          labelText: 'Опубликована в',
                        ),
                        onChanged: (String magazine){
                          publ.magazine = magazine;
                        },
                      ),
                      TextField(
                        decoration:  InputDecoration(
                          labelText: 'Год публикации',
                        ),
                        onChanged: (String year){
                          publ.year = year;
                        },
                      ),
                      TextField(
                        decoration:  InputDecoration(
                          labelText: 'Ссылка на elibrary',
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
                    onPressed: () {
                      setState(() {
                        //data.add(publ);
                        data.add(PublicationDone(publ.name, publ.authors, publ.year, publ.magazine, publ.citation, publ.link));
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
    return data.map((PublicationDone e) =>
        Padding(
          padding:  EdgeInsets.all(8.0),
          child: Container(child:
          Row(
            children: [
              Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius:  BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10)
                    ),
                    child: Container(
                      decoration:  BoxDecoration(
                        color: Colors.blue,
                      ),
                      height: 200,
                      child: Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(e.citation,
                              style:  TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
              ),

              Expanded(
                  flex: 7,
                  child: ClipRRect(
                    borderRadius:  BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10)
                    ),
                    child: Container(
                      decoration:  BoxDecoration(
                        color: Colors.blue,
                      ),
                      height: 200,
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
                            Text(e.authors,
                              style:  TextStyle(
                                color: Colors.white,
                              ),),
                            Text(e.magazine,
                              style:  TextStyle(
                                color: Colors.white,
                              ),),
                            Text(e.year,
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
              )

            ],
          ),),
        )
    ).toList();
  }

}