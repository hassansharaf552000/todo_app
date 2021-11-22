import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/AppConfigProvider.dart';

class  LanguageBottomSheet extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage('en');
            },
            child: provider.appLanguage == 'en'
                ? getSelectedItemWidget('English', context)
                : getUnselectedWidget('English', context),
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage('ar');
            },
            child: provider.appLanguage == 'ar'
                ? getSelectedItemWidget('العربيه', context)
                : getUnselectedWidget('العربيه', context),
          )
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style:
            TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),
          ),
          Icon(Icons.check, color: Theme.of(context).primaryColor)
        ],
      ),
    );
  }

  Widget getUnselectedWidget(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}