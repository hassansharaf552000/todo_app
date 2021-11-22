import 'package:flutter/material.dart';
import 'package:todo/data/firestoreUtills.dart';
import 'package:todo/data/todo.dart';

class Edit extends StatefulWidget {
  static const String routename = 'Edit';


  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  var formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime selectedDate = DateTime.now();
  late Todo item;

  @override
  Widget build(BuildContext context) {
    item=ModalRoute.of(context)!.settings.arguments as Todo;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 93, 156, 236),
        title: Text('Edit Task',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),),

      ),
      body: Stack(
          children: [
      Container(
      color: Color.fromARGB(255, 93, 156, 236),
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height * 0.1,
    ),
    Container(

    margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: Colors.white,

    ),
    width: MediaQuery.of(context).size.height*0.9,
    height: MediaQuery.of(context).size.height*0.8,
    ),
    SingleChildScrollView(
      child: Column(
      children: [
        SizedBox(
          height: 20,
        ),
      Text(
      'Edit Task',
      textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22
        ),
      ),
      Form(
      key: formKey,
      child: Column(
      children: [
      Container(
      margin: EdgeInsets.all(15),
      child: TextFormField(
        initialValue: item.title,
      decoration: InputDecoration(labelText: 'Title'),
      validator: (value) {
      if (value == null || value.isEmpty) {
      return "please enter todo title";
      }
      return null;
      },
      onChanged: (newValue) {
      item.title = newValue;
      },
      ),
      ),
      Container(
      margin: EdgeInsets.all(15),
      child: TextFormField(
        initialValue: item.description,
      minLines: 5,
      maxLines: 5,
      decoration: InputDecoration(
      labelText: 'Details',
      ),
      validator: (value) {
      if (value == null || value.isEmpty) {
      return "please enter todo details";
      }
      return null;
      },
      onChanged: (newValue) {
      item.description = newValue;
      },
      ),
      ),
      ],
      ),
      ),
      Container(
        margin: EdgeInsets.all(15),
        width: double.infinity,
        child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text('Select Date',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),),
        ),
      ),
      InkWell(
      onTap: () {
      showCalendar();
      },
      child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
      '${item.dateTime.day}/${item.dateTime.month}/${item.dateTime.year}',
      textAlign: TextAlign.center,
      ),
      ),
      ),
      SizedBox(
        height: 25,
      ),
      ElevatedButton(
      onPressed:(){
      edittask();
      },
      child: Text('Save Changes'))
      ],
      ),
    )
    ],
    ),

    );
    }

  void showCalendar() async {
    var newSelectedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (newSelectedDate != null) {
      item.dateTime = newSelectedDate;
      setState(() {});
    }
  }
  void edittask(){
    edittasktodo(item);
    Navigator.pop(context);
  }
}

