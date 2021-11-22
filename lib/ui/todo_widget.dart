import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/data/firestoreUtills.dart';
import 'package:todo/data/todo.dart';
import 'package:todo/provider/AppConfigProvider.dart';
import 'package:todo/ui/Edit.dart';
import 'package:todo/ui/my_theme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class todo_widget extends StatelessWidget {
  Todo item;

  todo_widget(this.item);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actions: [
        IconSlideAction(
          color: Colors.transparent,
          iconWidget: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.delete, color: Colors.white),
                Text(
                  AppLocalizations.of(context)!.delete,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          onTap: () {
            deleteTask(item)
                .onError((error, stackTrace) {})
                .then((value) {})
                .timeout(Duration(seconds: 30), onTimeout: () {});
          },
        )
      ],
      child: Expanded(
        child: InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(Edit.routename,arguments: item);
          },
          child: Container(

            width: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:provider.isDarkMode()?MyThemeData.darkbottombar:Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 60,
                  color: item.isDone
                      ? MyThemeData.greencolour
                      : Theme.of(context).primaryColor,
                  margin: EdgeInsets.symmetric(vertical: 12),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: item.isDone
                              ? TextStyle(
                                  color: MyThemeData.greencolour,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                )
                              : Theme.of(context).textTheme.headline1,
                        ),
                        Text(item.description,
                            style: item.isDone
                                ? TextStyle(
                                    color: MyThemeData.greencolour,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )
                                : Theme.of(context).textTheme.headline2),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    editisdone(item);
                  },
                  child: item.isDone?
                  Container(
                    margin: EdgeInsets.all(12),
                    child: Text(
                      AppLocalizations.of(context)!.done,style: TextStyle(
                      color: MyThemeData.greencolour,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                    ),

                  ):
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset('assets/images/ic_check.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
