import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo/provider/AppConfigProvider.dart';
import 'package:todo/ui/Edit.dart';
import 'package:todo/ui/homescreen.dart';
import 'package:todo/ui/my_theme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ChangeNotifierProvider(
      create: (buildContext) {
        return AppConfigProvider();
      },

      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.appTheme,
      routes: {
        HomeScreen.routName:(buildContext)=> HomeScreen(),
        Edit.routename:(buildContext)=> Edit(),

        
      },
      initialRoute: HomeScreen.routName,
      locale: Locale(provider.appLanguage),
    );
  }
}


