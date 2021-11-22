import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/data/firestoreUtills.dart';
import 'package:todo/data/todo.dart';
import 'package:todo/ui/todo_widget.dart';

class TodoListTab extends StatefulWidget {
  @override
  State<TodoListTab> createState() => _TodoListTabState();
}

class _TodoListTabState extends State<TodoListTab> {
  DateTime selectedDay=DateTime.now();

  DateTime focusedDay=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: [
            TableCalendar(
              selectedDayPredicate: (day) {
                return isSameDay(selectedDay, day);
              },
              onDaySelected: (sDay, fDay) {
                setState(() {
                  selectedDay = sDay;
                  focusedDay = fDay; // update `_focusedDay` here as well
                });
              },
              holidayPredicate: (day) => false,
              focusedDay: focusedDay,
              firstDay: DateTime.now().subtract(Duration(days: 365)),
              lastDay: DateTime.now().add(Duration(days: 365)),
              calendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(2)),
                selectedTextStyle: TextStyle(color: Colors.white),
                defaultTextStyle: TextStyle(color: Colors.black),
                defaultDecoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(2)),
                isTodayHighlighted: false,
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: Colors.black),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2))),
              weekendDays: [],
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Todo>>(
                stream: getTodosRefWithConverter()
                    .where('dateTime',
                    isEqualTo:
                    selectedDay.getDateOnly().millisecondsSinceEpoch)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Todo>> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error loading todos');
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<Todo> items = snapshot.data!.docs
                      .map((oldItem) => oldItem.data())
                      .toList();
                  return ListView.builder(
                    itemBuilder: (buildContext, index) {
                      return todo_widget(items[index]);
                    },
                    itemCount: items.length,
                  );
                },
              ),
            )
  ],
    ),
    );
  }
}
