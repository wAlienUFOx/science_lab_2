import 'package:flutter/material.dart';
import 'menu.dart';
import 'projects.dart';
import 'package:science_lab_2/utils.dart';


class Project_event extends StatefulWidget {
  const Project_event({Key? key}) : super(key: key);

  @override
  State<Project_event> createState() => _Project_eventState();
}

class Event {
  String name;
  String description;
  late DateTime dateTime;

  Event(this.name, this.description, this.dateTime);
}

class _Project_eventState extends State<Project_event> {

  List <Event> data = [
    Event("Проект 1", "описание меорприятия 1", DateTime(2000,)),
    Event("Другой проект", "другое описание мероприятия", DateTime(2022, 2, 2, 14, 00)),
  ];

  //Event event = Event.withNone();
  Event event = Event("null", "null", DateTime.now());

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мероприятия'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: ()=>
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Projects())
                  ),
              icon:  const Icon(Icons.list_alt)),
          IconButton(
            icon: const Icon(Icons.menu),
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
                title:  const Text('Добавить информацию о проекте'),
                shape:  const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                content:
                SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        decoration:  const InputDecoration(
                          labelText: 'Название проекта',
                        ),
                        onChanged: (String name){
                          event.name = name;
                        },
                      ),
                      TextField(
                        decoration:  const InputDecoration(
                          labelText: 'Описание мероприятия',
                        ),
                        onChanged: (String description){
                          event.description = description;
                        },
                      ),
                      buildDate()
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        data.add(Event(event.name, event.description, event.dateTime));
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
    return data.map((Event e) =>
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
                              color: Colors.white, fontSize: 20
                          ),),
                        Text(e.description,
                          style:  const TextStyle(
                            color: Colors.white,
                          ),),
                        Row(
                          children: [
                            Text(Utils.toDate(e.dateTime),
                              style:  const TextStyle(
                                color: Colors.white,
                              ),),
                            const Text("  "),
                            Text(Utils.toTime(e.dateTime),
                              style:  const TextStyle(
                                color: Colors.white,
                              ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
          )),
        )
    ).toList();
  }

  Widget buildDate() => buildHeader(
    header: 'Дата',
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: buildDropdownField(
            text: Utils.toDate(event.dateTime),
            onClicked: () => pickEventDateTime(pickDate: true),
          ),
        ),
        Expanded(
          child: buildDropdownField(
            text: Utils.toTime(event.dateTime),
            onClicked: () => pickEventDateTime(pickDate: false),
          ),
        ),
      ],
    ),
  );

  Widget buildHeader({
    required String header,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header, style: const TextStyle(fontWeight: FontWeight.bold)),
          child,
        ],
      );

  Widget buildDropdownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  Future pickEventDateTime({required bool pickDate}) async {
    final date = await pickDateTime(event.dateTime, pickDate: pickDate);
    if (date == null) return;
    setState(() => event.dateTime = date);
  }

  Future<DateTime?> pickDateTime(
      DateTime initialDate, {
        required bool pickDate,
      }) async {
    if (pickDate){
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(2021, 8),
        lastDate: DateTime(2100),
      );
      if (date == null) return null;
      final time = Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(initialDate));
      if (timeOfDay == null) return null;
      final date = DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      return date.add(time);
    }
  }
}
