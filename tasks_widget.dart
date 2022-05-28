import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:science_lab_2/classes/event_data_source.dart';
import 'package:science_lab_2/event_provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class TasksWidget extends StatefulWidget{
  @override
  _TasksWidgetState createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget>{
  @override
  Widget build(BuildContext context){
    final provider = Provider.of<EventProvider>(context);
    final selectedEvents = provider.eventsOfSelectedDate;

    if(selectedEvents.isEmpty){
      return Center(
        child: Text(
          'Нет запланированных дел',
          style: TextStyle(fontSize: 24),
        ),
      );
    }

    return SfCalendarTheme(
      data: SfCalendarThemeData(),
      child: SfCalendar(
        view: CalendarView.timelineDay,
        dataSource: EventDataSource(provider.events),
        initialDisplayDate: provider.selectedDate,
        appointmentBuilder: appointmentBuilder,
      ),
    );
  }

  Widget appointmentBuilder(BuildContext context,
      CalendarAppointmentDetails details,
      ){
    final event = details.appointments.first;

    return Container(
      width: details.bounds.width,
      height: details.bounds.height,
      decoration: BoxDecoration(
        color: event.backColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          event.title,
          maxLines : 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}