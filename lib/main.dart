import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jwa_alsalfh/screens/first_screen.dart';
import 'package:jwa_alsalfh/screens/players_screen.dart';
import 'package:provider/provider.dart';

import 'items/list_provider.dart';
import 'screens/pra_screen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  // final int ItemIndex;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final gameId = ModalRoute.of(context)?.settings.arguments as String;
    // final selectedGame = Ask_Data.firstWhere((game) => game.id == gameId);
    return ChangeNotifierProvider(
      create: (context) => ListProvider(),
      child: MaterialApp(
        title: 'Dynamic ListView with Provider',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('ar', 'AE'), // Arabic
        ],
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => FirstScreen(),
          PlayersScreen.screenRout: (context) => PlayersScreen(),
          PraScreen.screenRout: (context) => PraScreen(),
        },
        //home: FirstScreen(),
      ),
    );
  }
}
