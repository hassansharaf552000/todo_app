import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/AppConfigProvider.dart';
import 'package:todo/ui/addbottomsheet.dart';
import 'package:todo/ui/settigns_tab.dart';
import 'package:todo/ui/todo_list_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'my_theme_data.dart';
class HomeScreen extends StatefulWidget {
  static const routName='HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("hassan to do"),
        centerTitle: true,
        elevation: 0,


      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
            side: BorderSide(
                color: Colors.white, width: 4)),
        child: Icon(Icons.add),
        onPressed: () {
          showAddTodosheet();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(
                label: AppLocalizations.of(context)!.tasks,
                icon: Icon(Icons.list)),
            BottomNavigationBarItem(
                label: AppLocalizations.of(context)!.settings,
                icon: Icon(Icons.settings)),
          ],
        ),
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        elevation: 0,
      ),
      body: tabs[currentIndex],
    );
  }

  List<Widget> tabs = [
    TodoListTab(),
    SettingsTab(),

  ];

  void showAddTodosheet() {
    showModalBottomSheet(context: context, builder: (BuildContext) {
      return AddTodoBottomSheet();
    });
  }

}
