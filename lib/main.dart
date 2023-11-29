import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/counter.dart';
import 'package:provider_state_management/home_screen.dart';
import 'package:provider_state_management/provider_task/notifier.dart';
import 'package:provider_state_management/provider_task/provider_task_home.dart';
import 'package:provider_state_management/sharedpreference/sp_home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider( create: (_) =>Counter(),),
        ChangeNotifierProvider( create: (_) =>Notifier(),),
      ],
      child: Builder(
        builder: (BuildContext context){
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue
            ),
            home: ProviderTask(),
          );
        },
      ),
    );
  }
}
