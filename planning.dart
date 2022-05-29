import 'package:flutter/material.dart';
import 'package:science_lab_2/pages/event_editing.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'menu.dart';
import 'package:science_lab_2/event_provider.dart';
import 'package:provider/provider.dart';
//import 'package:science_lab_2/classes/event.dart';
import 'package:science_lab_2/classes/event_data_source.dart';
import 'package:science_lab_2/classes/tasks_widget.dart';


class Planning extends StatefulWidget {
  const Planning({Key? key}) : super(key: key);

  @override
  State<Planning> createState() => _PlanningState();
}

class _PlanningState extends State<Planning> {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Планирование'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () =>
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Menu())
                ),
          ),
        ],
      ),
      body: SfCalendar(
        view: CalendarView.month,
        firstDayOfWeek: DateTime.monday,
        dataSource: EventDataSource(events),
        onLongPress: (details){
          final provider = Provider.of<EventProvider>(context, listen: false);
          provider.setDate(details.date!);
          showModalBottomSheet(
            context: context,
            builder: (context) => TasksWidget(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () =>
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EventEditing())
            ),
      ),
    );
  }
}